/*******************************************************************************
* @file             mi_ooc_mi_ooc_s1.c
* @author           Marco Israel (MIS)
* @version          v. 1.5
* @date             2020-____TODO______
* @ingroup          ____TODO______
* @copydoc          mi_ooc_mi_ooc_s1.h
* @brief            ____TODO______
* @copyright        Copyright (c) 2018 Marco Israel. All rights reserved.
*
*
*
*
*
*               IMPORTANT NOTICE - COPYRIGHT INFORMATION
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

#include <mi_ooc_sub_template.h>



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



/* -------- END PART: prototypes ---------------------------------------------*/





/* ----- PART: APPLICATION prototypes ----------------------------------------*/



/**
 * virtual Function Table (vFTable) initialization.
 */
static void _vFTable__init_if_uninitialized(
        void
        );



/* -------- END PART: APPLICATION prototypes ---------------------------------*/





/* ----- PART: Virtual prototypes --------------------------------------------*/


/**
 * Default constructor.
 * @param ps__base Pointer to 'this' (its) base object.
 * @param ps__paramList Pointer to the base constructor function parameter list.
 */
STATIC void _ctor(
    mi_ooc_b1__this__st *const ps__base,
    mi_ooc_b1__ctorParamList__st *const  ps__baseParamList
    );




/**
 * Default destructor.
 * @param ps__base Pointer to 'this' (its) base object.
 */

STATIC void _dtor(
        mi_ooc_b1__this__st *const ps__base
        );




    /*BEGIN********************BEGIN********************BEGIN*/

/**
 * @todo ____TODO______
 * Example 'virtual method' prototype. Should be
 * replaced by real application-dependent virtual method(s).
 * NOTE: Should also prefixed with a '_' (underscore).
 * @param ps_this This derived object itself.
 */
STATIC uint8_t _____TODO______myFunction(
        mi_ooc_s1__this__st *const ps__base,
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
 **     Variables global EXTERN (public) implementation
 ******************************************************************************/





/*******************************************************************************
 **     Variables global STATIC (private) implementation
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
static mi_ooc_s1__vFTable__st   _vFTable__S;




/**
 * Flag to indicate if the vFTable is (already) initialized or not.
 * This should normally be done by the constructor during the first
 * instantiating of this object.
 */
static volatile uint8_t _activeInstanceCounter  = MI_OOC__NOT_INITIALIZED;





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
     * Prevent a re-initialization after the class was instantiated
     * at least one time or more. This would reset the vFTable.
     */

    if (MI_OOC__NO_INSTANCE == _activeInstanceCounter)
    {

        /**
         * First COPY the SUPERclass vFTable.
         */
        _vFTable__S.base__S = *_mi_ooc_b1__getPt_vFTable();

        /**
         * Second overwrite the base virtual functions which
         * need a specific implementation in this SUBclass.
         * All other function are inhered from the base class
         * like:
         *
         * _errorHandler();
         *
         *attention: NOTE: Because every object must (know
         * how to) create and destroy its own (members) there
         * is at least the ctor and dtor to overwrite.
         */
        _vFTable__S.base__S.virtualOperation__S.pf__ctor = &_ctor;

        _vFTable__S.base__S.virtualOperation__S.pf__dtor = &_dtor;

        /*BEGIN********************BEGIN********************BEGIN*/

        /**
         * @todo ____TODO______
         * assign (default) virtual SUBclass function here.
         * Third assign the methods of this SUBclass to the vFTable.
         */
        _vFTable__S.virtualOperation__S.pf______TODO______virtualFunction =
            &_____TODO______myFunction;

        /*END***********************END***********************END*/

    }

}



/* -------- END PART: APPLICATION functions ----------------------------------*/





/* ----- PART: Virtual functions ---------------------------------------------*/


STATIC void _ctor(
        mi_ooc_b1__this__st *const ps__base,
        mi_ooc_b1__ctorParamList__st *const  ps__baseParamList
        )
{

    if (NULLp != ps__base)
    {

        /**
         * First try call the super constructor explicit.
         * Therefor its own protected vFTable is needed#
         */
        mi_ooc_b1__vFTable__st * ps__baseVFTable =
           _mi_ooc_b1__getPt_vFTable();

       if(NULLp != ps__baseVFTable->virtualOperation__S.pf__ctor)
       {

           ps__baseVFTable->virtualOperation__S.pf__ctor(
                ps__base, ps__baseParamList);

       }
       else
       {

           MI_OOC_S1__ERROR_HANDLER__CTOR(ps__base)

       }

        /**
         * Make this object an instance of its base class and mark it as
         * active instantiated object.
         */

        ps__base->ps__virtualOperation =
            &_vFTable__S.base__S.virtualOperation__S;


        /**
         * Get (downcast) 'this' object from its base
         */
        mi_ooc_s1__this__st * ps__this =
                mi_ooc_s1__getPt_this__byPt_its_base(ps__base);


        if (NULLp != ps__this)
        {

           /**
            * Initialize this vFTable if not.
            * */
           _vFTable__init_if_uninitialized();


            /**
             * Link the initialized vFTable to this object.
             */
            ps__this->ps__virtualOperation = &_vFTable__S.virtualOperation__S;


            mi_ooc_s1__ctorParamList__st * ps__paramList = NULLp;


            if (NULLp != ps__baseParamList)
            {

            /**
             * Get (downcast) this paramList from its base paramList
             */
                ps__paramList =
                    mi_ooc_s1__getPt_ctorParamList__byPt_its_base(
                            ps__baseParamList);

            }

            if (NULLp != ps__paramList)
            {

                /*BEGIN********************BEGIN********************BEGIN*/

                /**
                 * @todo: ____TODO______
                 * Finally do some constructor code of this object members.
                 * By using given ctor parameter.
                 */
                ps__this->attributePublic__S.____TODO______subDataMember =
                    ps__paramList->
                    attributePublic__S.____TODO______subDataMember;

                /*END***********************END***********************END*/

            }
            else
            {

                /*BEGIN********************BEGIN********************BEGIN*/

                /**
                 * @todo: ____TODO______
                 * Alternatively set default values if no parameter
                 * parsed to this constructor.
                 */

                 ps__this->
                     attributePublic__S.____TODO______subDataMember = 0xFF;

                /*END***********************END***********************END*/

            }

            /*BEGIN********************BEGIN********************BEGIN*/

            /**
             * @todo: ____TODO______
             *Finally you can preform some general object construction here.
             */
            uint8_t ___TODO___ = 0u;
            (void)___TODO___;

            /*END***********************END***********************END*/

        }
        else
        {

            MI_OOC_S1__ERROR_HANDLER__CTOR(ps__base)

        }
    }
    else
    {

        MI_OOC__ERROR_HANDLER__NULL_POINTER

    }

}





STATIC void _dtor(
        mi_ooc_b1__this__st *const ps__base
        )
{

    if (NULLp != ps__base)
    {

        mi_ooc_s1__this__st * ps__this =
            mi_ooc_s1__getPt_this__byPt_its_base(ps__base);

        if(NULLp != ps__this)
        {


            /*BEGIN********************BEGIN********************BEGIN*/

            /**
             * First: Preform destructor code for 'this' sub object
             * which corresponds to this object and must be done
             * before this memory is freed.
             * @todo ____TODO______
             * Implement  'this'  destructor code.
             */
             ps__this->attributePublic__S.____TODO______subDataMember = 0xAAu;

             /*END***********************END***********************END*/

            /**
             * Second: 'this' is a SUBclass, so after performing
             * destruction code for 'this' sub members, we should
             * call the 'super' destructor from the SUPERclass to
             * deconstruct the super object members.
             *
             *attention: ATTENTION: Because we overwrite the dtor in
             * this class, we must call the base destructor explicitly.
             * Otherwise 'this' function will be called again.
             */
             _mi_ooc_b1__getPt_vFTable()->virtualOperation__S.pf__dtor(
                    ps__base);



            /**
             * This object is now no longer an instance of its base
             **/
             ps__this->ps__virtualOperation = NULLp;

        }
        else
        {

            MI_OOC_S1__ERROR_HANDLER__DTOR(ps__base)

        }

    }
    else
    {

        MI_OOC__ERROR_HANDLER__NULL_POINTER

    }

}





    /*BEGIN********************BEGIN********************BEGIN*/

/**
 * todo: ____TODO______
 * Implement your virtual functions here and add a description
 * or deleat this codeblock,
 */

STATIC uint8_t _____TODO______myFunction(
        mi_ooc_s1__this__st *const ps__this,
        uint8_t a,
        uint8_t b
        )
{

    uint8_t ret = 0u;

    if (NULLp != ps__this)
    {

        ret = (uint8_t) (a+b);

    }

    return ret;

}

    /*END***********************END***********************END*/



/* -------- END PART: Virtual functions --------------------------------------*/



/*******************************************************************************
 **     Function PROTECTED implementation (extern)
 ******************************************************************************/



PROTECTED mi_ooc_s1__vFTable__st * _mi_ooc_s1__getPt_vFTable(
        void
        )
{

    return &_vFTable__S;

}





/*******************************************************************************
 **     Function PUBLIC implementation (extern)
 ******************************************************************************/



EXTERN mi_ooc_s1__this__st * mi_ooc_s1__new(
         mi_ooc_s1__this__st *const ps__this,
         mi_ooc_s1__ctorParamList__st *const ps__paramList
         )
{

     mi_ooc_s1__this__st * ps__ret = NULLp;




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
        ps__ret = (mi_ooc_s1__this__st*)malloc(sizeof(
                    mi_ooc_s1__this__st));

    }
    #endif


    if (NULLp != ps__ret)
    {

        if(FALSE == mi_ooc_s1__is_this__instance_of_base(&ps__ret->base__S))
        {

            /**
             * First clear the memory area for this new object.
             */
            void* ps__retMemset = NULLp;

            ps__retMemset = memset(ps__ret, 0x00, sizeof(mi_ooc_s1__this__st) );


            if (ps__retMemset != ps__this)
            {

                MI_OOC__ERROR_HANDLER__NULL_POINTER;

            }
            else
            {


                /**
                 * Second Initialize the new object data by calling this
                 * constructor explicit. (_ctor can not be overwritten yet).
                 */
                if (NULLp != ps__paramList)
                {
                    _ctor(&(ps__ret->base__S), &ps__paramList->base__S);
                }
                else{

                    _ctor(&(ps__ret->base__S), NULLp);
                }


            /**
             * Finally incremet the number of active instances and save it as
             * an member of this object
             **/
            _activeInstanceCounter++;


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





EXTERN void mi_ooc_s1__deleate(
        mi_ooc_s1__this__st *const ps__this
        )
{

    if(NULLp != ps__this)
    {

        if(TRUE== mi_ooc_s1__is_this__instance_of_base(&ps__this->base__S))
        {

            /**
             * First deconstruct this object members
             */
            _dtor(&ps__this->base__S);

            /**
             * Leave the allocated memory area clean.
            */
            void* ps__retMemset = NULLp;
            ps__retMemset = memset(ps__this, 0x00, sizeof(mi_ooc_s1__this__st) );

            if (ps__retMemset != ps__this)
            {

                MI_OOC__ERROR_HANDLER__NULL_POINTER;

            }


            #if defined USE_HEAP
            /**
             * Afterwards free the objects memory.
             * If you allocate memory in HEAP, this is step is important
             * to prevent a heap overflow and corrupt stack data.
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





EXTERN uint8_t mi_ooc_s1__get_instanceCounter(
        mi_ooc_s1__this__st *const ps__this
        )
{

    uint8_t ret = 0u;

    if (NULLp != ps__this)
    {
        ret = _activeInstanceCounter;
    }

    return ret;

}





EXTERN bool_t mi_ooc_s1__is_this__instance_of_base(
        mi_ooc_b1__this__st *const ps__base
        )
{

    /**
     * Check if the base vFTable addresses are equal.
     * Because the vFTable are allocated in data/bss segment,
     * this addresses can also be used as unique "object identifier"
     */

    bool_t ret = FALSE;

    if(NULLp != ps__base)
    {

        if(ps__base->ps__virtualOperation ==
                &_vFTable__S.base__S.virtualOperation__S)
        {

            ret = TRUE;

        }

    }

    return ret;

}





EXTERN mi_ooc_s1__this__st * mi_ooc_s1__getPt_this__byPt_its_base(
        mi_ooc_b1__this__st *const ps__base
        )
{

    mi_ooc_s1__this__st * ps__ret = NULLp;

    if (TRUE == mi_ooc_s1__is_this__instance_of_base(ps__base) )
    {

        /**
         * just put "super" as the second parameter. The Preprocessor
         *  macro replacing will do the rest and returns this object.
         */
        ps__ret = OBJECT_POINTER_GET__THIS(
                mi_ooc_s1__this__st,
                base__S,
                ps__base);

    }
    else
    {

        MI_OOC_S1__ERROR_HANDLER__THIS_FROM_BASE(ps__base, &_vFTable__S)

    }

    return ps__ret;

}





EXTERN mi_ooc_s1__ctorParamList__st *
    mi_ooc_s1__getPt_ctorParamList__byPt_its_base(
        mi_ooc_b1__ctorParamList__st *const ps__baseParamList
        )
{

    mi_ooc_s1__ctorParamList__st * ps__ret = NULLp;


    /**
     * just put "super" as the second parameter. The Preprocessor
     *  macro replacing will do the rest and returns this object.
     */
    if(NULLp != ps__baseParamList)
    {

        ps__ret = OBJECT_POINTER_GET__THIS(
                mi_ooc_s1__ctorParamList__st,
                base__S,
                ps__baseParamList);

    }

    return ps__ret;

}




/* ----- PART: STATIC (Local) Functions --------------------------------------*/

/* -------- END PART: STATIC (Local) Functions -------------------------------*/



/* ----- PART: EXTERN (Global) Functions -------------------------------------*/

/* -------- END PART: EXTERN (Global) Functions ------------------------------*/


/**************** (C) COPYRIGHT Marco Israel ****** END OF FILE ***************/

