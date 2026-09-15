@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales by product'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmn_i_salesbyprod as select from zmn_so_for_mat as mat join I_SalesDocumentBasic as doc on mat.SalesDocument = doc.SalesDocument
{
    key mat.Product,
    key doc.SalesDocument,
    doc.SoldToParty,
    doc._SoldToParty.CustomerName,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    doc.TotalNetAmount,
    doc.TransactionCurrency
}
