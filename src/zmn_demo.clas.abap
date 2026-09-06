CLASS zmn_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    INTERFACES if_oo_adt_classrun .
    TYPES: ty_customer TYPE TABLE OF scustom.
    CLASS-METHODS get_customers IMPORTING VALUE(de_only)      TYPE string
                                EXPORTING VALUE(et_customers) TYPE  ty_customer.
    CLASS-METHODS get_function_data FOR TABLE FUNCTION zcustomers.
    CLASS-METHODS get_my_function_data FOR TABLE FUNCTION zmy_customers.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmn_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    get_customers( EXPORTING de_only = '' IMPORTING et_customers = DATA(x_all) ).
    out->write( |All records found { lines( x_all ) }| ).
    get_customers( EXPORTING de_only = 'X' IMPORTING et_customers = DATA(x_de) ).
    out->write( |German records found { lines( x_de ) }| ).
    SELECT FROM zcustomers(  de_only = 'X' ) FIELDS COUNTry, COUNT( * )  AS num GROUP BY country INTO TABLE @DATA(de_sum).
    out->write( name = 'DE country summary by country' data = de_sum ).
    SELECT FROM zcustomers(  de_only = '' ) FIELDS COUNTry, COUNT( * )  AS num GROUP BY country order by num DESCENDING INTO TABLE @DATA(all_sum).
    out->write( name = 'All country summary by country' data = all_sum ).
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

  METHOD get_function_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING scustom zcustom_de.
    IF :de_only = 'X' then
     RETURN select *    from zcustom_de
      where mandt = session_context( 'CLIENT'  );
      ELSE
     RETURN select * from scustom
      where mandt = session_context( 'CLIENT'  );

   END if;


  ENDMETHOD.

  METHOD get_my_function_data  BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING usr05  scustom zcustom_de.
  begin
  declare de integer;
   select count(*) into de from usr05 where bname = session_context( 'APPLICATIONUSER' )
    and parid = 'LAN' and parva = 'DE' and mandt = session_context(  'CLIENT' );
    if :de = 0 then
    temp = select * from scustom
    where mandt = session_context( 'CLIENT'  );
     else
    temp = select * from zcustom_de
    where mandt = session_context( 'CLIENT'  );

    end if;
    return :temp;
    end;
  ENDMETHOD.

ENDCLASS.
