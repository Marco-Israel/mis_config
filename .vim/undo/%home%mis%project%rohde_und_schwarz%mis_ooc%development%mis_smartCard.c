Vim�UnDo� ^n���t8Z�Й�M򲿃����ȁ�W�M  �                                   `VE�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `VE6     �              �   P/*******************************************************************************   * @file			mis_smartCard.c   * @copydoc		mis_smartCard.h   * @author		Marco Israel   * @version		Git   * @date			2021-03   * @ingroup		mis_ooc   =* @copyright    Copyright (c) 2018 Marco Israel. MIT License.   E* @note:		The pcsc-lite daemon and socket needs to be in state active   J* @brief		Object to communicate with smartcards by using the lib PCSCLite.   I* @detail		Because the PCSC-Lite lib holds on the one side all magic when   D*				communicating with a smartcard but also provides legacy and not   D*				implemented stuff, This object acts more as an apter or wrapper   D*				to the lib by providing only stuff which is needed and trough a   9				minimal set of functions and configuration by a user.   *   * MIT License   *   "* Copyright (c) 2021  Marco Israel   *   N* Permission is hereby granted, free of charge, to any person obtaining a copy   O* of this software and associated documentation files (the "Software"), to deal   N* in the Software without restriction, including without limitation the rights   K* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell   G* copies of the Software, and to permit persons to whom the Software is   :* furnished to do so, subject to the following conditions:   *   P* The above copyright notice and this permission notice shall be included in all   P* copies or substantial portions of the Software and are only true for all files   "* not holding an own license text.   *   *   L* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR   J* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   M* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   H* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER   O* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   O* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   * SOFTWARE.   *   P********************************************************************************   I* @attention:	The pcsc-lite deamon and socket needs to be in state active   L* The smartCard object uses the pcsclite lib under the hood. You can find it   M* online: https://pcsclite.apdu.fr/ .Further documentation can be found here.   *   /* You also need to install the PCSC-tools. E.g.   0* Ubuntu:     sudo apt-get install -y pcsc-tools   .*     sudo apt-get install libusb-dev libusb++   "*     sudo apt-get install libccid    *     sudo apt-get install pcscd   '*     sudo apt-get install libpcsclite1   **     sudo apt-get install libpcsclite-dev   '*     sudo apt-get install libpcsc-perl   %*     sudo apt-get install pcsc-tools   *     sudo apt-get update   *   P* ArchLinux:  sudo pacman -S libusb-dev libusb++ ... pcsc-tools (same as above).   *   >* The pcsc-lite deamon and socket needs to be in state active:   +* 				- sudo systemctl status pcscd.service   +*  				- sudo systemctl status pcscd.socket   "*  			May starting ones is enough.   ?*  			E.g. the socket starts the service at least on ArchLinux.   P*******************************************************************************/                   #include <bits/stdint-uintn.h>   #include <mis_smartCard.h>   #include <pcsclite.h>   #include <reader.h>   #include <stdint.h>   #include <winscard.h>               P#define MIS_SMARTCARD__ERROR_HANDLER__DEFAULT( msg )                           \   M	printf( "\nERROR\n%s", msg );                                              \   4	MI_OOC__ERROR_HANDLER__PRINTLOCATION( "SMARTCARD" )               P#define MIS_SMARTCARD__ERRO_HANDLER__PCSCLITE( erroCode )                      \   "	pcsc_stringify_error( erroCode );               *#ifndef MIS_SMARTCARD__ERROR_HANDLER__CTOR   M	#define MIS_SMARTCARD__ERROR_HANDLER__CTOR( ps__this )                     \    		MI_OOC__ERROR_HANDLER__DEFAULT   #endif               *#ifndef MIS_SMARTCARD__ERROR_HANDLER__DTOR   M	#define MIS_SMARTCARD__ERROR_HANDLER__DTOR( ps__this )                     \    		MI_OOC__ERROR_HANDLER__DEFAULT   #endif               OSTATIC INLINE void _mis_smartCard__vFTable_base__init_if_uninitialized( void );               !STATIC void _mis_smartCard__ctor(   )	mis_smartCard__this__st* const ps__this,   9	mis_smartCard__ctorParamList__st* const ps__paramList );               LSTATIC void _mis_smartCard__dtor( mis_smartCard__this__st* const ps__this );               )STATIC void _mis_smartCard__errorHandler(   )	mis_smartCard__this__st* const ps__this,   A	mis_smartCard__errorHandlerParamList__st* const ps__paramList );               NSTATIC uint8_t _mis_smartCard__ioctl( mis_smartCard__this__st* const ps__this,   K                                      mis_ooc_b1__ioctlCommand__et command,   6                                      uint8_t value );               NSTATIC uint16_t _mis_smartCard__send( mis_smartCard__this__st* const ps__this,   L                                      uint8_t const* const pb__bufferSource,   K                                      uint16_t const sizeof_bufferSource );               STATIC uint16_t   B	_mis_smartCard__receive( mis_smartCard__this__st* const ps__this,   E                             uint8_t* const pbOUT__bufferDestination,   E                             uint16_t const sizeof_bufferDestination,   I                             mis_smartCard__receiveType__et receiveTye );               ,STATIC uint16_t _mis_smartCard__sendReceive(   )	mis_smartCard__this__st* const ps__this,   @	mis_smartCard__sendReceiveParamList__st* const ps__paramList );               PSTATIC void __mis_smartCard__connect( mis_smartCard__this__st* const ps__this );               /STATIC INLINE void __mis_smartCard__disConnect(   )	mis_smartCard__this__st* const ps__this,   	uint16_t flag );               CSTATIC SCARD_IO_REQUEST __mis_smartCard__get_ProtocolInformation_S(   0	mis_smartCard__protocolType__et protocolType );               STATIC INLINE uint16_t   H	__mis_smartCard__receive_last( mis_smartCard__this__st* const ps__this,   K                                   uint8_t* const pbOUT__bufferDestination,   M                                   uint16_t const sizeof_bufferDestination );               STATIC INLINE uint16_t   G	__mis_smartCard__receive_atr( mis_smartCard__this__st* const ps__this,   J                                  uint8_t* const pbOUT__bufferDestination,   L                                  uint16_t const sizeof_bufferDestination );               0static mis_smartCard__vFTable__st _vFTable_S = {           6	.virtualOperation_S.pf__ctor = &_mis_smartCard__ctor,           6	.virtualOperation_S.pf__dtor = &_mis_smartCard__dtor,           F	.virtualOperation_S.pf__errorHandler = &_mis_smartCard__errorHandler,           8	.virtualOperation_S.pf__ioctl = &_mis_smartCard__ioctl,           6	.virtualOperation_S.pf__send = &_mis_smartCard__send,           <	.virtualOperation_S.pf__receive = &_mis_smartCard__receive,           D	.virtualOperation_S.pf__sendReceive = &_mis_smartCard__sendReceive,       };               Istatic volatile uint8_t _activeInstanceCounter = MI_OOC__NOT_INITIALIZED;               STATIC INLINE void   <	_mis_smartCard__vFTable_base__init_if_uninitialized( void )   {       5	if ( MI_OOC__NO_INSTANCE == _activeInstanceCounter )   	{ }   }               STATIC void   	_mis_smartCard__ctor(   *		mis_smartCard__this__st* const ps__this,   9		mis_smartCard__ctorParamList__st* const ps__paramList )   {   	if ( NULLPTR != ps__this )   	{       9		_mis_smartCard__vFTable_base__init_if_uninitialized( );   B		ps__this->ps__virtualOperation = &_vFTable_S.virtualOperation_S;   '		__mis_smartCard__connect( ps__this );       !		if ( NULLPTR != ps__paramList )   		{ }   	}   	else   	{   %		MI_OOC__ERROR_HANDLER__NULL_POINTER   	}   }               STATIC void   @	_mis_smartCard__dtor( mis_smartCard__this__st* const ps__this )   {   	if ( NULLPTR != ps__this )   	{        		ps__this->ps__virtualOperation   1			= (mis_smartCard__thisVirtualOperation__st*)0;   >		__mis_smartCard__disConnect( ps__this, SCARD_UNPOWER_CARD );   	}   	else   	{   %		MI_OOC__ERROR_HANDLER__NULL_POINTER   	}   }               STATIC void   	_mis_smartCard__errorHandler(   *		mis_smartCard__this__st* const ps__this,   A		mis_smartCard__errorHandlerParamList__st* const ps__paramList )   {   	(void)ps__this;   	(void)ps__paramList;   	MI_OOC__ERROR_HANDLER__DEFAULT   }               STATIC uint8_t   @	_mis_smartCard__ioctl( mis_smartCard__this__st* const ps__this,   @                           mis_ooc_b1__ioctlCommand__et command,   *                           uint8_t value )   {   	(void)ps__this;   	(void)command;   	(void)value;   	return 0u;   }               STATIC uint16_t   ?	_mis_smartCard__send( mis_smartCard__this__st* const ps__this,   @                          uint8_t const* const pb__bufferSource,   >                          uint16_t const sizeof_bufferSource )   {       	uint16_t ret = 0u;       @	if ( ( NULLPTR != ps__this ) && ( NULLPTR != pb__bufferSource )   '	     && ( 0u < sizeof_bufferSource ) )   	{       6		mis_smartCard__sendReceiveParamList__st ParamList__S   ,			= { .pb__bufferSource = pb__bufferSource,   2			    .sizeof_bufferSource = sizeof_bufferSource,    			    .pbOUT__bufferDestination   :			    = ps__this->attributePrivate_S.b__lastReceivedData,    			    .sizeof_bufferDestination   F			    = sizeof( ps__this->attributePrivate_S.b__lastReceivedData ) };           ?		ret = _mis_smartCard__sendReceive( ps__this, &ParamList__S );   	}       	return ret;   }               STATIC uint16_t   B	_mis_smartCard__receive( mis_smartCard__this__st* const ps__this,   E                             uint8_t* const pbOUT__bufferDestination,   E                             uint16_t const sizeof_bufferDestination,   H                             mis_smartCard__receiveType__et receiveTye )   {   	uint16_t ret = 0u;       H	if ( ( NULLPTR != ps__this ) && ( NULLPTR != pbOUT__bufferDestination )   -	     && ( 0u != sizeof_bufferDestination ) )   	{       		switch ( receiveTye )   		{   #			case MIS_SMARTCARD_RECEIVE_LAST:   				{   )					ret = __mis_smartCard__receive_last(   						ps__this,   						pbOUT__bufferDestination,   !						sizeof_bufferDestination );   					break;   				}   "			case MIS_SMARTCARD_RECEIVE_ATR:   				{   (					ret = __mis_smartCard__receive_atr(   						ps__this,   						pbOUT__bufferDestination,   !						sizeof_bufferDestination );   					break;   				}   			default:   				{   					ret = 0u;   					break;   				}   		}   	}       	return ret;   }               STATIC uint16_t   	_mis_smartCard__sendReceive(   *		mis_smartCard__this__st* const ps__this,   @		mis_smartCard__sendReceiveParamList__st* const ps__paramList )   {       	int64_t ret = 0u;       ?	if ( ( NULLPTR != ps__this ) && ( NULLPTR != ps__paramList ) )   	{       ,		SCARD_IO_REQUEST tmp_protocolInformation_S   0			= __mis_smartCard__get_ProtocolInformation_S(   9				ps__this->attributePublic_S.smartCard_protocolType );       '		uint64_t tmp_maxAndReceivedDatalength   -			= ps__paramList->sizeof_bufferDestination;       		ret = SCardTransmit(   ;			(int64_t)ps__this->attributePrivate_S.smartcardHandleID,   			&tmp_protocolInformation_S,   #			ps__paramList->pb__bufferSource,   &			ps__paramList->sizeof_bufferSource,   			&tmp_protocolInformation_S,   +			ps__paramList->pbOUT__bufferDestination,   #			&tmp_maxAndReceivedDatalength );           !		if ( ( SCARD_S_SUCCESS != ret )   9		     || ( UINT16_MAX < tmp_maxAndReceivedDatalength ) )   		{   G			MIS_SMARTCARD__ERROR_HANDLER__DEFAULT( "ERROR during Transmission" )   /			MIS_SMARTCARD__ERRO_HANDLER__PCSCLITE( ret )   		}   		else   		{   7			ps__this->attributePrivate_S.sizeof_lastReceivedData   -				= (uint16_t)tmp_maxAndReceivedDatalength;       /			ret = (int64_t)tmp_maxAndReceivedDatalength;   		}   	}       	return (uint16_t)ret;   }               %PROTECTED mis_smartCard__vFTable__st*   &	_mis_smartCard__getPt_vFTable( void )   {   	return &_vFTable_S;   }               EXTERN mis_smartCard__this__st*   =	mis_smartCard__new( mis_smartCard__this__st* const ps__this,   O                        mis_smartCard__ctorParamList__st* const ps__paramList )   {   ,	mis_smartCard__this__st* ps__ret = NULLPTR;       	if ( NULLPTR != ps__this )   	{   		ps__ret = ps__this;   	}       #if defined USE_HEAP   	else   	{       -		ps__ret = (mis_smartCard__this__st*)malloc(   '			sizeof( mis_smartCard__this__st ) );   	}       #endif       	if ( NULLPTR != ps__ret )   	{   J		if ( ( &_vFTable_S.virtualOperation_S != ps__ret->ps__virtualOperation )   ,		     || ( 0u == _activeInstanceCounter ) )   		{       !			void* ps__retMemset = NULLPTR;   			ps__retMemset   A				= memset( ps__ret, 0x00, sizeof( mis_smartCard__this__st ) );       "			if ( ps__retMemset != ps__ret )   			{   '				MI_OOC__ERROR_HANDLER__NULL_POINTER   			}   			else   			{       3				_mis_smartCard__ctor( ps__ret, ps__paramList );       				_activeInstanceCounter++;       B				ps__ret->attributePrivate_S.objectNr = _activeInstanceCounter;   			}   		}   	}   	else   	{   %		MI_OOC__ERROR_HANDLER__NULL_POINTER   	}       	return ps__ret;   }               EXTERN void   A	mis_smartCard__delete( mis_smartCard__this__st* const ps__this )   {   	if ( NULLPTR != ps__this )   	{       I		if ( &_vFTable_S.virtualOperation_S == ps__this->ps__virtualOperation )   		{       $			_mis_smartCard__dtor( ps__this );       !			void* ps__retMemset = NULLPTR;   			ps__retMemset   B				= memset( ps__this, 0x00, sizeof( mis_smartCard__this__st ) );       #			if ( ps__retMemset != ps__this )   			{   '				MI_OOC__ERROR_HANDLER__NULL_POINTER   			}       #if defined USE_HEAP       			free( ps__this );   #endif           %			if ( _activeInstanceCounter > 0u )   			{   				_activeInstanceCounter--;   			}   		}   	}   	else   	{   %		MI_OOC__ERROR_HANDLER__NULL_POINTER   	}   }               EXTERN uint8_t   $	mis_smartCard__get_instanceCounter(   +		mis_smartCard__this__st* const ps__this )   {   	(void)ps__this;   	return _activeInstanceCounter;   }               STATIC void   D	__mis_smartCard__connect( mis_smartCard__this__st* const ps__this )   {   	int64_t ret = 0u;   	ret = SCardEstablishContext(   		SCARD_SCOPE_SYSTEM,   
		NULLPTR,   
		NULLPTR,   ;		(int64_t*)&ps__this->attributePrivate_S.readerHandleID );       	if ( SCARD_S_SUCCESS != ret )   	{   .		MIS_SMARTCARD__ERRO_HANDLER__PCSCLITE( ret )   	}   	else   	{       H		uint64_t tmp_longestReaderName = MIS_SMARTCARD__MAXLENGTH_READERNAMES;   		ret = SCardListReaders(   8			(int64_t)ps__this->attributePrivate_S.readerHandleID,   			NULLPTR,   :			ps__this->attributePrivate_S.b__connectedCardList[ 0 ],   			&tmp_longestReaderName );           		if ( SCARD_S_SUCCESS != ret )   		{   /			MIS_SMARTCARD__ERRO_HANDLER__PCSCLITE( ret )   		}   		else   		{   			uint64_t tmp_protocolType;       B			if ( 0u != ps__this->attributePublic_S.smartCard_protocolType )   			{   				tmp_protocolType   :					= ps__this->attributePublic_S.smartCard_protocolType;   			}   			else   			{   A				tmp_protocolType = ( SCARD_PROTOCOL_T0 | SCARD_PROTOCOL_T1 );   			}           			ret = SCardConnect(   9				(int64_t)ps__this->attributePrivate_S.readerHandleID,   ;				ps__this->attributePrivate_S.b__connectedCardList[ 0 ],   				SCARD_SHARE_SHARED,   				tmp_protocolType,   >				(int64_t*)&ps__this->attributePrivate_S.smartcardHandleID,   				&tmp_protocolType );           5			ps__this->attributePublic_S.smartCard_protocolType   8				= (mis_smartCard__protocolType__et)tmp_protocolType;            			if ( SCARD_S_SUCCESS != ret )   			{   0				MIS_SMARTCARD__ERRO_HANDLER__PCSCLITE( ret )   			}   		}   	}   }               STATIC INLINE void   F	__mis_smartCard__disConnect( mis_smartCard__this__st* const ps__this,   0                                 uint16_t flag )   {   G	SCardDisconnect( (int64_t)ps__this->attributePrivate_S.readerHandleID,   	                 flag );   	SCardReleaseContext(   <		(int64_t)ps__this->attributePrivate_S.smartcardHandleID );   2	ps__this->attributePrivate_S.readerHandleID = 0u;   5	ps__this->attributePrivate_S.smartcardHandleID = 0u;   }               STATIC SCARD_IO_REQUEST   ,	__mis_smartCard__get_ProtocolInformation_S(   0		mis_smartCard__protocolType__et protocolType )   {   	SCARD_IO_REQUEST ret = { 0u };   	switch ( protocolType )   	{   !		case MIS_SMARTCARD_PROTOCOL_T0:   			{   				ret = g_rgSCardT0Pci;   
				break;   			}   !		case MIS_SMARTCARD_PROTOCOL_T1:   			{   				ret = g_rgSCardT0Pci;   
				break;   			}   #		case MIS_SMARTCARD_PROTOCOL_NONE:   			{   *				MIS_SMARTCARD__ERROR_HANDLER__DEFAULT(   +					"No protocol given for transmitting" )   
				break;   			}   
		default:   			{   
				break;   			}   	}   	return ret;   }               STATIC INLINE uint16_t   H	__mis_smartCard__receive_last( mis_smartCard__this__st* const ps__this,   K                                   uint8_t* const pbOUT__bufferDestination,   L                                   uint16_t const sizeof_bufferDestination )   {       	uint16_t ret = 0u;   	uint16_t currentMinLength   ,		= (uint16_t)MIN( sizeof_bufferDestination,   M	                     ps__this->attributePrivate_S.sizeof_lastReceivedData );       A	for ( uint16_t currentByte = 0u; currentByte < currentMinLength;   	      ++currentByte )   	{   )		pbOUT__bufferDestination[ currentByte ]   E			= ps__this->attributePrivate_S.b__lastReceivedData[ currentByte ];       		++ret;   	}       	return ret;   }               STATIC INLINE uint16_t   G	__mis_smartCard__receive_atr( mis_smartCard__this__st* const ps__this,   J                                  uint8_t* const pbOUT__bufferDestination,   K                                  uint16_t const sizeof_bufferDestination )   {       	int64_t ret = 0u;   3	uint64_t tmp_sizeOfAtr = sizeof_bufferDestination;       	ret = SCardGetAttrib(   :		(int64_t)ps__this->attributePrivate_S.smartcardHandleID,   		SCARD_ATTR_ATR_STRING,   		pbOUT__bufferDestination,   		&tmp_sizeOfAtr );       	if ( SCARD_S_SUCCESS != ret )   	{   F		MIS_SMARTCARD__ERROR_HANDLER__DEFAULT( "ERROR during Transmission" )   .		MIS_SMARTCARD__ERRO_HANDLER__PCSCLITE( ret )   		ret = 0u;   	}   	else   	{   		ret = (int64_t)tmp_sizeOfAtr;   	}   	return (uint16_t)ret;   }5�_�                        O    ����                                                                                                                                                                                                                                                                                                                                          O       v   O    `VE�    �        �    �        �    �         �      P/*******************************************************************************   * @file			mis_smartCard.c5��