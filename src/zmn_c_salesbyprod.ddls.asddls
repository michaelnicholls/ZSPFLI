@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales by preod'
@Metadata.ignorePropagatedAnnotations: false
define root view entity zmn_c_salesbyprod as projection on zmn_i_salesbyprod
{
   @UI.selectionField: [{position: 10}]
   @UI.lineItem: [{ position: 10 }]
    key Product,
    @UI.lineItem: [{ position: 20 }]
    key SalesDocument,
    @UI.lineItem: [{ position: 15 }]
    ProductName,
    @UI.lineItem: [{ position: 30 }]
    SoldToParty,
      @UI.lineItem: [{ position: 40 }]
  
    CustomerName,
      @UI.lineItem: [{ position: 50 }]
  
    TotalNetAmount,
    TransactionCurrency
}
