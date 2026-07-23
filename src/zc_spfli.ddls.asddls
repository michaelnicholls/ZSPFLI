@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zc_spfli as projection on zspfli
{
       @UI.facet: [ { id: 'details',
                     purpose: #STANDARD,
                     position: 10,
                     label: 'Details',
                     type: #IDENTIFICATION_REFERENCE } ]
   
    @UI.lineItem: [{ position: 10 }]
    @UI.identification: [{ position: 10 }]
    key Carrid,
    @UI.identification: [{ position: 20 }]
    @UI.lineItem: [{  position: 20}]
    key Connid,
    Countryfr,
    @UI.identification: [{ position: 30 }]
    @UI.lineItem: [{  position: 30}]
    Cityfrom,
    Airpfrom,
    Countryto,
    @UI.identification: [{ position: 40 }]
    @UI.lineItem: [{  position: 40}]
    Cityto,
    Airpto,
//    Fltime,
    Deptime,
    Arrtime,
    Distid,
    Fltype,
    Period
} 
