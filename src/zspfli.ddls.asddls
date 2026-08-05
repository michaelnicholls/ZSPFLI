@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'spfli'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zspfli as select from spfli
association [0..1] to z_nextflight as _next on $projection.Carrid = _next.Carrid and $projection.Connid = _next.Connid

{
    key carrid as Carrid,
    key connid as Connid,
    carrid as carrid_s,
    countryfr as Countryfr,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto,
    airpto as Airpto,
 //   fltime as Fltime,
    deptime as Deptime,
    arrtime as Arrtime,
    distid as Distid,
    fltype as Fltype,
    period as Period,
    _next
    }
