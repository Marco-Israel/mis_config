/*******************************************************************************
* @file             mi_ooc_mi_ooc_s1.h
* @author           Marco Israel (MIS)
* @version          v. 1.5
* @date             2020-____TODO______
* @ingroup          ____TODO______
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
 **     INCLUDED GUARDS
 ******************************************************************************/

#ifndef MI_OOC_S1__H
#define MI_OOC_S1__H








/*******************************************************************************
 *******************************************************************************
 **                     DEFINITIONS
 *******************************************************************************
 ******************************************************************************/



/*******************************************************************************
 **     INCLUDED global defined information
 ******************************************************************************/
#include <mi_ooc.h>
#include <mi_ooc_base_template.h>




/*******************************************************************************
 **     Variables global EXTERN (public) definition
 ******************************************************************************/





/*******************************************************************************
 **     MACRO definition
 ******************************************************************************/


/**
 * You can define code her for handling constructor errors or exceptions.
 */
#ifndef MI_OOC_S1__ERROR_HANDLER__CTOR
#define MI_OOC_S1__ERROR_HANDLER__CTOR(ps__this)                            \
    MI_OOC__ERROR_HANDLER__DEFAULT
#endif





/**
 * You can define code her for handling deconstructor errors or exceptions.
 */
#ifndef MI_OOC_S1__ERROR_HANDLER__DTOR
#define MI_OOC_S1__ERROR_HANDLER__DTOR(ps__this)                            \
    MI_OOC__ERROR_HANDLER__DEFAULT
#endif





/**
 * You can define code her for handling cast from base to this.
 */
#ifndef MI_OOC_S1__ERROR_HANDLER__THIS_FROM_BASE
#define MI_OOC_S1__ERROR_HANDLER__THIS_FROM_BASE(ps__super, ps__vFTable)    \
    MI_OOC__ERROR_HANDLER__DEFAULT
#endif





/**
 * You can define code her for handling cast from base constructor parameters
 * to this constructor parameters.
 */
#ifndef MI_OOC_S1__ERROR_HANDLER__CTORPARAMLIST_FROM_BASE
#define MI_OOC_S1__ERROR_HANDLER__CTORPARAMLIST_FROM_BASE(ps__super)        \
    MI_OOC__ERROR_HANDER__DEFAULT
#endif




/*******************************************************************************
 **     Type GENERAL definition
 ******************************************************************************/



/**
 * The object itself
 */
typedef struct mi_ooc_s1__this__S
    mi_ooc_s1__this__st;





/**
 * This private attributes (object variables and other data members)
 */
typedef struct mi_ooc_s1__thisAttributePrivate__S
    mi_ooc_s1__thisAttributePrivate__st;





/**
 * This public attributes (object variables and other data members)
 */
typedef struct mi_ooc_s1__thisAttributePublic__S
    mi_ooc_s1__thisAttributePublic__st;





/**
 * This virtual operations (virtual or abstract methods / functions)
 */
typedef struct mi_ooc_s1__thisVirtualOperation__S
    mi_ooc_s1__thisVirtualOperation__st;





/**
 * The constructor parameter list:  Variables parsed to the constructor
 * of 'this' object as function parameters.
 */
typedef struct mi_ooc_s1__ctorParamList__S
    mi_ooc_s1__ctorParamList__st;





/**
 * The virtual Function Table (vFTable)
 */
typedef struct mi_ooc_s1__vFTable__S
    mi_ooc_s1__vFTable__st;





/**
 * Parameter list to be parsed to the error and exception handling function
 * of this sub object . This can also be used as and error object to collect
 * error or exception information,
 */
typedef struct mi_ooc_s1__errorHandlerParamList__S
                mi_ooc_s1__errorHandlerParamList__st;



/*******************************************************************************
 **     Type FUNCTION POINTER definition
 ******************************************************************************/


/* ----- PART: VIRTUAL functions (methods) -----------------------------------*/



    /*BEGIN********************BEGIN********************BEGIN*/

/**
 * @todo ____TODO______
 * Example 'virtual method' prototype. Should be
 * replaced by real application-dependent virtual method(s).
 */
typedef uint8_t (mi_ooc_s1______TODO________ft)(
        mi_ooc_s1__this__st * ps__this,
        uint8_t a,
        uint8_t b
        );

    /*END***********************END***********************END*/



/* -------- END PART: VIRTUAL functions (methods) ----------------------------*/





/*******************************************************************************
 **     Type UNION definition
 ******************************************************************************/





/*******************************************************************************
 **     Type ENUM definition
 ******************************************************************************/





/*******************************************************************************
 **     Type STRUCTURE definition
 ******************************************************************************/



/**
 * Attributes of this class which are private Neither setter or getter
 * nor ctor parameters are available. This members are only used internal
 * the object to holds stats and internal information.
 */
 struct mi_ooc_s1__thisAttributePrivate__S
{

     /**
      * The ID or instance number of this object after it was allocated
      */
     uint8_t objectNr;


    /*BEGIN********************BEGIN********************BEGIN*/

    /**
     * @todo ____TODO______
     * Add private attributes a description here or delta this code block.
     */

    /*BEGIN********************BEGIN********************BEGIN*/

};





/**
 * Attributes of this class and its instantiated objects
 */
 struct mi_ooc_s1__thisAttributePublic__S
{

    /*BEGIN********************BEGIN********************BEGIN*/

    /**
     * @todo ____TODO______
     * Add public attributes a description here or delta this code block.
     */
    uint8_t ____TODO______subDataMember;

    /*BEGIN********************BEGIN********************BEGIN*/

};





/**
 * Virtual Operations (virtual methods / functions) specific to this SUBclass
 */
struct  mi_ooc_s1__thisVirtualOperation__S
{

    /*BEGIN********************BEGIN********************BEGIN*/

    /**
     * @todo ____TODO______
     * add virtual functions (methods) and documentation here
     * or delete this code block.
     */
      mi_ooc_s1______TODO________ft*  pf______TODO______virtualFunction;


    /*END***********************END***********************END*/

};





/**
 * Object context, collects all public stuff of an instantiated class (object).
 */
struct mi_ooc_s1__this__S
{

    /**
     * This SUBclass virtual functions, which can be replaced
     * during run time individual for each object.
     *
     * @attention ATTENTION: To prevent errors, this should be
     * the first structure member. It is the only variable where
     * memory will be allocated for. All other structures can
     * be empty empty and so can be optimized away. Depending on
     * the toolchain, this could result in errors.
     */
    mi_ooc_s1__thisVirtualOperation__st * ps__virtualOperation;


    /**
     * Inherit (a copy of the) super (Base) object context.
     *
     * @attention: NOTE: To prevent problems and to enable compatibility
     * it is recommended to make 'super' the first parameter.
     *
     * @attention ATTENTION: This must be a COPY:
     * Otherwise it would not be possible to hold object independent values!
     */
    mi_ooc_b1__this__st base__S;


    /**
     * The collection of public object data member
     */
    mi_ooc_s1__thisAttributePublic__st attributePublic__S;


    /**
     * The collection of private object data member
     */
    mi_ooc_s1__thisAttributePrivate__st attributePrivate__S;

};





/**
 * The virtual functions table (vFTable) holds all virtual functions (methods)
 * which can be overwritten by the user during rue time.
 */
struct  mi_ooc_s1__vFTable__S
{

    /**
     * Inherit (a copy of the) super (Base) object context.
     *
     *attention NOTE: To prevent problems and to enable compatibility
     * it is recommended to make 'super' the first parameter.
     *
     *attention ATTENTION: This must be a COPY: Otherwise it would not
     * not be possible to overwrite the base function pointers.
     */
    mi_ooc_b1__vFTable__st base__S;


    /**
     * Virtual operations (virtual methods or virtual functions)
     */
    mi_ooc_s1__thisVirtualOperation__st virtualOperation__S;

};





/**
 * Variables parsed to the constructor of 'this' object as function parameters.
 */
 struct mi_ooc_s1__ctorParamList__S
{

    /**
    * Inherit (a copy of the) super (Base) object context.
    *
    *attention NOTE: To prevent problems and to enable compatibility
    * it is recommended to make 'super' the first parameter.
    *
    *attention ATTENTION: This must be a COPY:
    * Otherwise it would not be possible to hold object independent values!
    */
    mi_ooc_b1__ctorParamList__st base__S;


    /**
     * Parameters corresponding to this object data Members.
     */
    mi_ooc_s1__thisAttributePublic__st attributePublic__S;

};





/**
 * An Error and Exception object which collects information about
 * an error. It can be parsed to an errorHandler for instance.
 */
struct  mi_ooc_s1__errorHandlerParamList__S
{

    /*
     * Base error handling information
     */
    mi_ooc_b1__errorHandlerParamList__st base__S;

};




/*******************************************************************************
 **     Function PUBLIC PROTOTYPE definition (extern)
 ******************************************************************************/



/* ----- PART: PUBLIC INLINE functions (methods) -----------------------------*/



/* -------- END PART: PUBLIC INLINE functions (methods) ----------------------*/





/* ----- PART: PUBLIC functions (methods) ------------------------------------*/



/**
 * Object allocator
 * Allocates memory if using the heap and initialize the objects members
 * (like the vFTable for instance).
 * @param ps__this This base object itself if it is already allocated in stack
 * or in the data memory segment. Otherwise parsing a NULL to this argument,
 * this function will try to allocate heap memory if __USING_HEAP__ is allowed.
 * @param ps__paramList List of function parameters.
 * @return Returns a pointer to this object. If the memory is allocated in
 * heap the function will return the pointer to the new heap data block after
 * it has allocated it. Otherwise it will return the pointer parsed given by
 * the parameter ps__this.
 *
 *attention: NOTE: There are different ways to allocate memory:
 * For instance, you can allocate memory in the stack, statically
 * in the data segment or manually from the heap. That is why you can
 * parse a pointer to 'this' to this function and get (maybe the same)
 * pointer returned.
 */
EXTERN mi_ooc_s1__this__st * mi_ooc_s1__new(
        mi_ooc_s1__this__st *const ps__this,
        mi_ooc_s1__ctorParamList__st *const ps__paramList
        );





/**
 * Object deallocator
 * Preform some cleanup stuff (like closing pipes) by calling
 * the deconstructor and free the memory if using the heap.
 * Last one is important when using the heap memory.
 * @param ps__this This derived object itself.
 */
EXTERN void mi_ooc_s1__deleate(
        mi_ooc_s1__this__st *const ps__this
        );





/**
 * Returns the class identifier
 * @param ps__this This base object itself
 * @return Returns the class identifier.
 */
EXTERN mi_ooc_s1__vFTable__st * mi_ooc_s1__get_classID(
        mi_ooc_s1__this__st *const ps__this
        );





/**
 * Returns the number of objects instantiated from this class.
 * @param ps_this This base object itself.
 * @return Returns the number of currently active instances (objects)
 * allocated from this class.
 */
EXTERN uint8_t mi_ooc_s1__get_instanceCounter(
        mi_ooc_s1__this__st *const ps__this
        );





/**
 * Returns a pointer to the SUBclass by the pointer to the SUPERclass
 * @param ps_this This derived object itself.
 * @return Returns the pointer to this (its) base class object.
 */
EXTERN mi_ooc_s1__this__st * mi_ooc_s1__getPt_this__byPt_its_base(
        mi_ooc_b1__this__st *const ps__base
        );





/**
 * Returns a pointer to the SUBctorParamList by
 * the pointer to the SUPERctorParamList.
 * @param ps_baseCtorParamList The base _ctor paramList.
 * @return Returns a pointer to the base class _ctor paramList.
 */
EXTERN mi_ooc_s1__ctorParamList__st *
        mi_ooc_s1__getPt_ctorParamList__byPt_its_base(
               mi_ooc_b1__ctorParamList__st *const ps__baseCtorParamList
               );





/**
 * Returns if an object is an instance of  'this'  base class.
 * @param ps_this This derived object itself,
 * @returns Returns TRUE if the given object is an instance of this base class.
 */
EXTERN bool_t mi_ooc_s1__is_this__instance_of_base(
        mi_ooc_b1__this__st *const ps__base
        );



/* -------- END PART: PUBLIC functions (methods) -----------------------------*/





/* ----- PART: PROTECTED functions (methods) ---------------------------------*/



/**
 * Returns a pointer to the objects private virtual Function Table (vFTable),
 * @return Returns a pointer the vFTable.
 *
 * NOTE: This function should be 'protected' or 'restricted  and only used
 * if really needed in ´derived objects only.  That is why this function is
 * prefixed by an '_' (underscore)
 *
 *attention: ATTENTION; The function does care about if the vFTable is
 * already initialized or not.
 */
PROTECTED mi_ooc_s1__vFTable__st * _mi_ooc_s1__getPt_vFTable(
        void
        );



/* -------- END PART: PROTECTED functions (methods) --------------------------*/








/*******************************************************************************
 *******************************************************************************
 **                     IMPLEMENTATIONS
 *******************************************************************************
 ******************************************************************************/



/*******************************************************************************
 **     Function INLINE implementation
*******************************************************************************/



/* ----- PART: NORMAL object functions (methods) -----------------------------*/



/**
 * @brief Returns the number of this object which was assigend after new().
 * @Param ps__this Pointer to object
 *
 * @Returns Returns the number of this object which was assigend after new().
 */
STATIC INLINE uint8_t mi_ooc_s1__get_objectNr(
        mi_ooc_s1__this__st *const ps__this
        )
{

    uint8_t ret = 0u;

    if(NULLp != ps__this)
    {

        ret =  ps__this->attributePrivate__S.objectNr;

    }

    return ret;

}



/* -------- END PART: Normal object functions (methods) ----------------------*/





/* ----- PART: SET and GET (setter and getter) functions ---------------------*/



    /*BEGIN********************BEGIN********************BEGIN*/



    /**
     * @todo ____TODO______
     * Dummy setter function/method.  Add inline set functions
     * (methods) here for corresponding object Members
     * which should be possible to modify by other classes.
     */
STATIC INLINE void mi_ooc_s1__set_____TODO______subDataMember(
        mi_ooc_s1__this__st *const ps__this,
        uint8_t newValue
        )
{

    if(NULLp != ps__this)
    {

        ps__this->attributePublic__S.____TODO______subDataMember = newValue;

    }

}





    /**
     * @todo ____TODO______
     * Dummy setter function/method.  Add inline get functions
     * (methods) here for corresponding object Members which
     * values should be readable for other classes.
     */
STATIC INLINE uint8_t mi_ooc_s1__get_____TODO______subDataMember(
        mi_ooc_s1__this__st *const ps__this
        )
{

    uint8_t ret = 0;

    if (NULLp != ps__this)
    {

        ret =  ps__this->attributePublic__S.____TODO______subDataMember;

    }

    return ret;

}



    /*END***********************END***********************END*/



/* -------- END PART: SET and GET (setter and getter) functions --------------*/





/* ----- PART: VIRTUAL object functions (methods) ----------------------------*/


/**
 * Direct call to virtual the base errorHandler.
 * @param ps__this This base object itself.
 * @param ps__paramList List of function parameters.
 */
STATIC INLINE void mi_ooc_s1__errorHandler(
        mi_ooc_s1__this__st *const ps__this,
        mi_ooc_s1__errorHandlerParamList__st *const ps__paramList
        )
{

    if (NULLp != ps__this)
    {

        mi_ooc_b1__errorHandler(&ps__this->base__S,&ps__paramList->base__S);

    }

}





    /**
     * Add INLINE shortcuts to virtual functions if you like.
     *
     * Note: Of course you can use the vFTable only. But:
     * using inline wrapper functions  makes the ooc handling
     * smarter ,easier and well more structured.
     *
     *
     * INLINE functions should cost any additional cpu
     * overhead if they will be short.
     *
     * @attention ATTENTION: If you using INLINE shortcut functions,
     * hold these as short as possible like one line online.
     * Otherwise it is possible that the compiler does not inline
     * them but makes them normal function instead, A normal
     * function call would cost cpu overhead.
     */



    /*END***********************END***********************END*/



/**
  * @todo ____TODO______
 * replaced by real application-dependent virtual method(s) or deleted.
 * Also document the arguments here for doxygen
 */
STATIC INLINE uint8_t mi_ooc_s1______TODO________(
        mi_ooc_s1__this__st * ps__this,
        uint8_t a,
        uint8_t b
        )
{

    uint8_t ret = 0;

    if(NULLp !=
            ps__this->ps__virtualOperation->pf______TODO______virtualFunction)
    {

       ret =  ps__this->ps__virtualOperation->pf______TODO______virtualFunction(
             ps__this, a, b);

    }


    if(NULLp != ps__this)
    {
        ret = mi_ooc_b1______TODO________(&ps__this->base__S, a, b);
    }

    return ret;

}

    /*END***********************END***********************END*/


/* ---------- END PART: Virtual object functions (methods) -------------------*/






/* ----- PART: CLEAN CODE (Local helper) Functions ---------------------------*/

/*--------------------- END PART: CLEAN CODE (Local helper) Functions --------*/


/* ----- PART: STATIC (Local) Functions --------------------------------------*/

/*--------------------- END PART: STATIC (Local) Functions -------------------*/


/* ----- PART: EXTERN (Global) Functions -------------------------------------*/

/*--------------------- END PART: EXTERN (Global) Functions ------------------*/



/**************** (C) COPYRIGHT Marco Israel ****** END OF FILE ***************/

#endif /*MI_OOC_S1__H*/
