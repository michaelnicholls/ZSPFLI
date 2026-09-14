CLASS zmn_salesdocs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmn_salesdocs IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  " get some different fields from zmn_c_salesdoc

  select from zmn_c_salesdoc
  fields SalesDocument, SalesDocumentItem, Product, OrderQuantity
  where Product like 'TG%'
  into table @data(t1).
  out->write( |Basic fields| ).

  select from zmn_c_salesdoc
  fields SalesDocument, SalesDocumentItem, Product, ProductName, OrderQuantity
  where Product like 'TG%'
  into table @data(t2).
  out->write( |Add product name| ).

  select from zmn_c_salesdoc
  fields SalesDocument, SalesDocumentItem, Product, ProductName, OrderQuantity, SoldToParty, CustomerName
  where Product like 'TG%'
  into table @data(t3).
  out->write( |Add product name and customer name| ).

  data(a) = 1.

  ENDMETHOD.
ENDCLASS.
