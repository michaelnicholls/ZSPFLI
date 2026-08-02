@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'read:'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SPFLI_READ as select distinct from zspfli join scarr on zspfli.Carrid = scarr.carrid
{
    key zspfli.Carrid, scarr.carrname
    
}
