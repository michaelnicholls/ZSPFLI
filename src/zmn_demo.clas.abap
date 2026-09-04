CLASS zmn_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    INTERFACES if_oo_adt_classrun .
    types: ty_customer type table of scustom.
    class-METHODS get_customers importing value(de_only) TYPE string
        EXPORTING value(et_customers) type  ty_customer.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmn_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  get_customers( exporting de_only = '' importing et_customers = data(x_all) ).
  out->write( |All records found { lines( x_all ) }| ).
  get_customers( exporting de_only = 'X' importing et_customers = data(x_de) ).
  out->write( |German records found { lines( x_de ) }| ).
   ENDMETHOD.

  METHOD get_customers
  BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING scustom zcustom_de.
  if :de_only <> 'X' then
  et_customers = select * from scustom
    where mandt = session_context( 'CLIENT'  );
    else
    et_customers = select * from zcustom_de where mandt = session_context( 'CLIENT' );


end if;
  ENDMETHOD.

ENDCLASS.
