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
  data(p_products) = 'T-%'. " matching products
  out->write(  |Matching products: { p_products }| ).
  " get some different fields from zmn_c_salesdoc

  select from zmn_c_salesdoc
  fields SalesDocument, SalesDocumentItem, Product, OrderQuantity
  where Product like @p_products
  into table @data(t1).
  out->write( |Basic fields| ).

  select from zmn_c_salesdoc
  fields SalesDocument, SalesDocumentItem, Product, ProductName, OrderQuantity
  where Product like @p_products
  into table @data(t2).
  out->write( |Add product name| ).

  select from zmn_c_salesdoc
  fields SalesDocument, SalesDocumentItem, Product, ProductName, OrderQuantity, SoldToParty, CustomerName
  where Product like @p_products
  into table @data(t3).
  out->write( |Add product name and customer name| ).

  select from zmn_c_salesdoc
  fields DISTINCT SalesDocument, SoldToParty, CustomerName
  where Product like @p_products
  into table @data(t4).
  out->write( |Order summary - distinct| ).

  select from zmn_c_salesdoc
  fields SalesDocument, max( SoldToParty ) as soldto, max( CustomerName ) as custname, sum( NetAmount ) as netamount,
  count(  SalesDocumentItem ) as items
  GROUP BY SalesDocument
  into table @data(t5).
  out->write( |Order summary - group by| ).

  data(a) = 1.

  ENDMETHOD.
ENDCLASS.
