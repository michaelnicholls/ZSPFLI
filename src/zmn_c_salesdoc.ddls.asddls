@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales doc'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmn_c_salesdoc as projection on zmn_salsdoc
{
    @UI.lineItem: [{ position: 10 }]
    @UI.selectionField: [{position: 10}]
    key SalesDocument,
    @UI.lineItem: [{ position: 20 }]
    key SalesDocumentItem,
        @UI.lineItem: [{ position: 25 }]
    
    _SalesDocument.SalesOffice,   
     @UI.lineItem: [{ position: 26 }]
    
    _SalesDocument.SalesDistrict,
    @UI.lineItem: [{position: 22}]
    _SalesDocument.CreationDate,
    Division,
        @UI.lineItem: [{ position: 30 }]
    @UI.selectionField: [{position: 20 }]
    Material,
        @UI.lineItem: [{ position: 40 }]
    
    _ProductText[ 1:  Language = 'E'].ProductName,
    @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
        @UI.lineItem: [{ position: 50 }]
    
    OrderQuantity,
    OrderQuantityUnit,
    SalesGroup,
        @UI.lineItem: [{ position: 60 }]
  @UI.selectionField: [{position: 30}]
    SoldToParty,
        @UI.lineItem: [{ position: 70 }]

    
    _SoldToParty.CustomerName
}
