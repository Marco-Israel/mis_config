/*******************************************************************************
* @file             mi_ooc_mi_ooc_b1.c
* @author           Marco Israel (MIS)
* @version          v. 1.5
* @date             2020-____TODO______
* @ingroup          ____TODO______
* @copydoc          mi_ooc_mi_ooc_b1.h
* @brief            ____TODO______
* @copyright        Copyright (c) 2018 Marco Israel. All rights reserved.
*
*
*
*
*
                IMPORTANT NOTICE - COPYRIGHT INFORMATION
*
*
*
* English:
*
* THIS SOFTWARE AND ITS OBJECT ORIENTED ARCHITECTURE IN THE PROGRAMMING
* LANGUAGE C AS WELL AS THE NAMING CONVENTION IS PROVIDED "AS IS" by
* MARCO ISRAEL. ANY EXPRESS OR IMPLIED  WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO  EVENT SHALL MARCO ISRAEL
* BE LIABLE FOR ANY DIRECT, INDIRECT, * INCIDENTAL, SPECIAL, EXEMPLARY,
* OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT * LIMITED TO, PROCUREMENT
* OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY  OF LIABILITY,
* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT(INCLUDING NEGLIGENCE OR
* OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
* ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*     * Redistribution of source code must retain the this copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistribution in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in
*       the documentation and/or other materials provided with the
*       distribution.
*     * Neither the name of the <organization> nor the names of its
*       contributors may be used to endorse or promote products derived
*       from this software without specific prior written permission.
*
* Beside this content above, the customer company according to the
* LICENCE.txt in the root folder (root marker .git) is allowed to
* use and modify this file when keeping this copyright information.
*
*
* German:
*
* Alle Inhalte in source und binaer Form, insbesondere die hier aufgezeigte
* object orientierte Softwarearchitektur- in der Programmiersprache C,
* seiner coding Conversation (Namensgebung etwa fuer Variablen, Funktionen,
* Parameter, Datentypen, usw.) sind urheberrechtlich geschuetzt.
* Alle Rechte, einschließlich der Verwendung, Veroeffentlichung, Bearbeitung,
* Uebersetzung oder Vervielfältigung, bleiben Marco Israel vorbehalten.
* Dieses gilt auch fuer alle Instanzen, Kopien oder sonstigen Verwendungen
* in source oder binearform. In jedem Fall sind diese Copyright und Urheber
* Informationen zu uebernehmen und duerfen nicht ohne Zustimmung vereandert
* oder entfernt werden. Marco Israel uebernimmt keine Haftung in irgendeiner
* Form und Art und Weise, die durch die Nutzung dieser Architektur oder seiner
* Kopien und Instancen in source oder binaerform direkt oder indirekt
* entstehen und kann nicht fuer Schaeden belangt werden.
*
* Abweichend von disen oben genannten Inhalten ist das beauftragende
* Unternehme nlaut LICENCE.txt im root Verzeichnis (root marker .git)
* berechtigt, die Inhalte dieser Datei zu nutzen und zu ändern insofern
* diese Copyright Information beibehalten wird.
*
*
*
********************************************************************************
* @detail
* ____TODO______
*
*
********************************************************************************
* @attention
* ____TODO______
*
*
********************************************************************************
* @todo
* ____TODO______
*
*
*******************************************************************************/








/*******************************************************************************
 *******************************************************************************
 **                     DEFINITIONS
 *******************************************************************************
 ******************************************************************************/



/*******************************************************************************
 **     INCLUDED global defined information
 ******************************************************************************/

#include <mi_ooc_base_template.h>



/*******************************************************************************
 **     MACRO definition
 ******************************************************************************/




/*******************************************************************************
 **     Type GENERAL definition
 ******************************************************************************/




/*******************************************************************************
 **     Type FUNCTION POINTER definition
 ******************************************************************************/




/*******************************************************************************
 **     Type UNION definition
 ******************************************************************************/




/*******************************************************************************
 **     Type ENUM definition
 ******************************************************************************/




/*******************************************************************************
 **     Type STRUCTURE definition
 ******************************************************************************/





/*******************************************************************************
 **     Function PRIVATE PROTOTYPE definition (static)
 ******************************************************************************/



/* ----- PART: INLINE prototypes ---------------------------------------------*/



/* -------- END PART: INLINE prototypes --------------------------------------*/





/* ----- PART: APPLICATION prototypes ----------------------------------------*/


/**
 * Initialized the virtual Function Table (vFTable) if its not.
 */
STATIC void _vFTable__init_if_uninitialized(
        void
        );


/* -------- END PART: APPLICATION prototypes ---------------------------------*/





/* ----- PART: Virtual prototypes --------------------------------------------*/


 /**
  * Default constructor.
  * @param ps__this This base object itself.
  * @param ps__paramList List of function parameters.
  */
STATIC void _ctor(
        mi_ooc_b1__this__st *const ps__this,
        mi_ooc_b1__ctorParamList__st *const  ps__paramList
        );





/**
 * Default destructor.
 * @param ps__this This base object itself.
 */

STATIC void _dtor(
        mi_ooc_b1__this__st* const ps__this
        );





/**
* Default error handler,
 * @param ps__this This base object itself.
 * @param ps__paramList List of function parameters.
*/
STATIC void _errorHandler(
        mi_ooc_b1__this__st *const ps__this,
        mi_ooc_b1__errorHandlerParamList__st *const ps__paramList
        );




    /*BEGIN********************BEGIN********************BEGIN*/

/**
 * @todo ____TODO______
 * Example 'virtual method' prototype. Should be
 * replaced by real application-dependent virtual method(s).
 * NOTE: Should also prefixed with a '_' (underscore).
 */
STATIC uint8_t  _____TODO______myBaseFunction(
        mi_ooc_b1__this__st *const ps__this,
        uint8_t a,
        uint8_t b
        );

    /*END***********************END***********************END*/



/* -------- END PART: Virtual prototypes -------------------------------------*/








/*******************************************************************************
 *******************************************************************************
 **                     IMPLEMENTATIONS
 *******************************************************************************
 ******************************************************************************/



/*******************************************************************************
 **     Variables global EXTERN (Public) implementation
 ******************************************************************************/





/*******************************************************************************
 **     Variables global STATIC (Private) implementation
 ******************************************************************************/

/**
 * A table holding virtual function which can be replaced during run-time.
 * Such functions are called 'virtual' in OOC context.
 *
 * NOTE 1: Because we want only one virtual function table (vFTable) for each
 * 'Class', not for each instance of a 'Class' (called 'object'), the virtual
 * function table is allocated in the data segment. So the vFTable must be
 * initialized only once. Each instance have afterwards the same (overwritten)
 * functions (methods) (also if the first instance gets deleted).
 *
 * NOTE 2: This makes it also easy to use its address as an object identifier.
 */
static mi_ooc_b1__vFTable__st   _vFTable_S = {

    .virtualOperation__S.pf__ctor=&_ctor,

    .virtualOperation__S.pf__dtor =  &_dtor,

    .virtualOperation__S.pf__errorHandler = &_errorHandler

};





/**
 * Flag to indicate if the vFTable is (already) initialized or not.
 * This should normally be done by the constructor during the first
 * instantiating of this object.
 */
static volatile uint8_t  _activeInstanceCounter = MI_OOC__NOT_INITIALIZED;






/*******************************************************************************
 **     Function PRIVATE INLINE implementation (STATIC inline)
 ******************************************************************************/





/*******************************************************************************
 **     Function PRIVATE implementation (static)
 ******************************************************************************/



/* ----- PART: APPLICATION functions -----------------------------------------*/



STATIC void _vFTable__init_if_uninitialized(void)
{

    /**
     * Prevent a reinitialization after the class was instantiated
     * at least one time or more. This would reset the vFTable.
     */

    if (MI_OOC__NO_INSTANCE == _activeInstanceCounter) {

        /*First set default virtual function. There are at least
         * the default constructor and deconstructor to set as well
         * as a default error handling function.
         */


        /*BEGIN********************BEGIN********************BEGIN*/

        /**
         * @todo ____TODO______
         * assign (default) virtual BASEclass function here.
         * Third assign the default base class methods to the vFTable.
         */
        _vFTable_S.virtualOperation__S.pf______TODO______ =
            &_____TODO______myBaseFunction;

        /*END***********************END***********************END*/

    }

}



/* -------- END PART: APPLICATION functions ----------------------------------*/





STATIC void _ctor(
        mi_ooc_b1__this__st* const ps__this,
        mi_ooc_b1__ctorParamList__st *const  ps__paramList
        )
{

    if (NULLp != ps__this)
    {

        /** Initialize this vFTable and link it to this object. */
        _vFTable__init_if_uninitialized();


        ps__this->ps__virtualOperation = &_vFTable_S.virtualOperation__S;


        if (NULLp != ps__paramList)
        {

            /*BEGIN********************BEGIN********************BEGIN*/
            /**
             * @todo: ____TODO______
             * construct the object with the paramList values
             * if there are any.
             */
            ps__this->attributePublic__S.____TODO______baseDataMember =
                ps__paramList->attributePublic__S.____TODO______baseDataMember;

            uint8_t ___TODO___;
            (void)___TODO___;
            /*END***********************END***********************END*/

        }
        else
        {

            /*BEGIN********************BEGIN********************BEGIN*/

            /**
             * @todo:  ____TODO______
             * Set default values if no parameter are
             * parsed to this constructor.
             */
            ps__this->attributePublic__S.____TODO______baseDataMember = 0xFF;
            uint8_t ___TODO___;
            (void)___TODO___;
            MI_OOC_B1__ERROR_HANDLER__CTOR(ps__this);

            /*END***********************END***********************END*/

        }

        /*BEGIN********************BEGIN********************BEGIN*/
        /**
         * @todo: ____TODO______
         * Preform finally some general object construction here.
         */
        uint8_t ___TODO___;
        (void)___TODO___;

        /*END***********************END***********************END*/

    }
    else
    {

        MI_OOC__ERROR_HANDLER__NULL_POINTER

    }
}





STATIC void _dtor(
        mi_ooc_b1__this__st *const ps__this
        )
{


    if (NULLp != ps__this)
    {

        /**
         * Delete the link to the vFTable because this is no longer an member.
         */
         ps__this->ps__virtualOperation =
             (mi_ooc_b1__thisVirtualOperation__st*) 0;


        /*BEGIN********************BEGIN********************BEGIN*/

        /**
         * Base object deconstruction code.
         * The base dtor shall deconstruct the base struct (object)
         * members and preform cleanup like closing pipes.
         *
         * @todo ____TODO______
         * Implement  'this'  destructor code.
         */
         ps__this->attributePublic__S.____TODO______baseDataMember = 0xAAu;



        /*END***********************END***********************END*/

    }
    else {

        MI_OOC__ERROR_HANDLER__NULL_POINTER

    }

}





STATIC void _errorHandler(
        mi_ooc_b1__this__st *const ps__this,
        mi_ooc_b1__errorHandlerParamList__st *const ps__paramList
        )
{

    (void)ps__this;
    (void)ps__paramList;


    MI_OOC__ERROR_HANDLER__DEFAULT

}





    /*BEGIN********************BEGIN********************BEGIN*/

/**
 * todo: ____TODO______
 * Implement your virtual functions here and add a
 * description or delete this code block,
 */

STATIC uint8_t _____TODO______myBaseFunction(
        mi_ooc_b1__this__st *const ps__this,
        uint8_t a,
        uint8_t b
        )
{

    uint8_t ret = 0u;

    if (NULLp != ps__this)
    {
        ret = (uint8_t) (a+ b);
    }

    return ret;

}

     /*END***********************END***********************END*/



/* -------- END PART: Virtual functions --------------------------------------*/



/*******************************************************************************
 **     Function PROTECTED implementation (extern)
 ******************************************************************************/



PROTECTED mi_ooc_b1__vFTable__st * _mi_ooc_b1__getPt_vFTable(
        void
        )
{

    return &_vFTable_S;

}





/*******************************************************************************
 **     Function PUBLIC implementation (extern)
 ******************************************************************************/



EXTERN mi_ooc_b1__this__st * mi_ooc_b1__new(
         mi_ooc_b1__this__st *const ps__this,
         mi_ooc_b1__ctorParamList__st *const ps__paramList
         )
{

    mi_ooc_b1__this__st * ps__ret = NULLp;


    if (NULLp != ps__this)
    {

        ps__ret = ps__this;

    }
    #if defined USE_HEAP
    else
    {

        /**
         * Allocate a memory area if object should be stored in the heap
         * heap segment. Alternative the objects can be pushed on the
         * stack or stored in the datasegment.
         */
        ps__ret = (mi_ooc_b1__this__st*) malloc(sizeof(
                    mi_ooc_b1__this__st
                    ));

    }
    #endif


    if (NULLp != ps__ret)
    {

        if( (&_vFTable_S.virtualOperation__S != ps__ret->ps__virtualOperation)
               || (0u == _activeInstanceCounter ) )
        {

            /**
             * First clear the memory area for this new object.
             */

            void* ps__retMemset = NULLp;
            ps__retMemset = memset(ps__ret, 0x00, sizeof(mi_ooc_b1__this__st) );

            if(ps__retMemset != ps__ret){

                MI_OOC__ERROR_HANDLER__NULL_POINTER

            }
            else
            {

                 /**
                  * Second init the new object data by calling this _ctor
                  * explicit. (_ctor can not be overwritten yet).
                  */
                 _ctor(ps__ret, ps__paramList);


                /**
                  * Finally increment the number of active instances
                  * after first call to new() only.
                  */
                 _activeInstanceCounter++;

                 /**
                 * Save its instance Nr as object number after first call to
                 * new() only.
                 */
                 ps__ret->attributePrivate__S.objectNr = _activeInstanceCounter;

            }


        }

    }
    else
    {
        MI_OOC__ERROR_HANDLER__NULL_POINTER

    }

    return ps__ret;

}





EXTERN void mi_ooc_b1__deleate(
        mi_ooc_b1__this__st *const ps__this
        )
{

    if(NULLp != ps__this)
    {

        if(&_vFTable_S.virtualOperation__S ==
                ps__this->ps__virtualOperation)
        {

            /**
             * First deconstruct the object members
             */

            _dtor(ps__this);

            /**
             * Leave the allocated memory area clean.
            */
            void* ps__retMemset = NULLp;

            ps__retMemset = memset(ps__this, 0x00, sizeof(mi_ooc_b1__this__st) );

            if(ps__retMemset != ps__this){

                MI_OOC__ERROR_HANDLER__NULL_POINTER

            }


            #if defined USE_HEAP
            /**
             * Afterwards free the objects memory.
             * If you allocate memory in HEAP, this is step is important
             * to prevent a heap overflow and corrupt stack data,
             */
            free(ps__this);
            #endif


            /**
             * Finally decrement the number of active instances
             */
            if (_activeInstanceCounter > 0u )
            {

                _activeInstanceCounter--;

            }

        }

    }
    else
    {

        MI_OOC__ERROR_HANDLER__NULL_POINTER

    }

}





EXTERN uint8_t mi_ooc_b1__get_instanceCounter(
        mi_ooc_b1__this__st *const ps__this
        )
{

    (void)ps__this;
    return _activeInstanceCounter;

}



/* ----- PART: STATIC (Local) Functions --------------------------------------*/

/* -------- END PART: STATIC (Local) Functions -------------------------------*/



/* ----- PART: EXTERN (Global) Functions -------------------------------------*/

/* -------- END PART: EXTERN (Global) Functions ------------------------------*/



/**************** (C) COPYRIGHT Marco Israel ****** END OF FILE ***************/

