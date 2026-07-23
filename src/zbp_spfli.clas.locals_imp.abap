CLASS lhc_zspfli DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zspfli RESULT result.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE zspfli.

ENDCLASS.

CLASS lhc_zspfli IMPLEMENTATION.

   METHOD get_instance_authorizations.
  " checks delete and update
    READ ENTITIES OF zspfli IN LOCAL MODE ENTITY zspfli
         FIELDS ( Carrid )
         WITH CORRESPONDING #( keys )
         RESULT DATA(carriers).
    LOOP AT carriers ASSIGNING FIELD-SYMBOL(<carrier>).
      DATA(update) = if_abap_behv=>auth-allowed.
      DATA(delete) = if_abap_behv=>auth-allowed.
      " TODO: variable is assigned but never used (ABAP cleaner)
      SELECT SINGLE @abap_true FROM zc_spfli_update INTO @DATA(exists) WHERE Carrid = @<carrier>-carrid.
      IF sy-subrc <> 0.
        update = if_abap_behv=>auth-unauthorized.
      ENDIF.
      SELECT SINGLE @abap_true FROM zc_spfli_delete INTO @exists WHERE Carrid = @<carrier>-carrid.
      IF sy-subrc <> 0.
        delete = if_abap_behv=>auth-unauthorized.
      ENDIF.
      APPEND VALUE #( %tky    = <carrier>-%tky
                      %update = update
                      %delete = delete )
             TO result.
    ENDLOOP.
  ENDMETHOD.


  METHOD precheck_create.
  " checks whether we can add
 LOOP AT entities ASSIGNING FIELD-SYMBOL(<carrier>).
       select SINGLE @abap_true from zc_spfli_add into @data(exists) where Carrid = @<carrier>-Carrid.
       if sy-subrc <> 0.
       append value #(  %tky = <carrier>-carrid ) to failed-zspfli.
       APPEND value #(  %tky = <carrier>-carrid
            %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                text = |You can't create for carrier { <carrier>-carrid }| ) ) to reported-zspfli.
       endif.
 endloop.

  ENDMETHOD.
ENDCLASS.
