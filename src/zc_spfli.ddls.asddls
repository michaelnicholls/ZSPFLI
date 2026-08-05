@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection'
//@Metadata.ignorePropagatedAnnotations: true
define root view entity zc_spfli as projection on zspfli
{
       @UI.facet: [ { id: 'details',
                     purpose: #STANDARD,
                     position: 10,
                     label: 'Details',
                     type: #IDENTIFICATION_REFERENCE } ]
    
 //   @UI.lineItem: [{ position: 10 }]
 // hide on the list report, visible on the details page
    @UI.identification: [{ position: 10 }]
   
    @Consumption.valueHelpDefinition: [{ entity:{name: 'ZC_SPFLI_ADD', element: 'Carrid' }}]
    key Carrid,
    @UI.identification: [{ position: 20 }]
    @UI.lineItem: [{  position: 20}]
    key Connid,
     @UI.lineItem: [{ position: 15 }]
   @Consumption.valueHelpDefinition: [{ entity:{name: 'ZC_SPFLI_READ', element: 'Carrid'}}]
     @UI.selectionField: [{ position: 10 }]
     // used for selection field
    carrid_s,
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
    Period,
    @UI.identification: [{ position: 50 }]
    @UI.lineItem: [{  position: 50}]
    
    _next.nextdate
} 
