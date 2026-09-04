CLASS zmn_fill_de DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmn_fill_de IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  delete FROM zcustom_de.
  INSERT zcustom_de from ( select from scustom fields * where country = 'DE' ).
  out->write( |Filled ZCUSTOM_DE with German customers| ).
  ENDMETHOD.
ENDCLASS.
