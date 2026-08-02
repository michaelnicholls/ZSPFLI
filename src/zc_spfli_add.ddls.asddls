@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'add?'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SPFLI_ADD as select distinct  from scarr //right outer join scarr on zcarr.Carrid = scarr.carrid
{
    key carrid, carrname
}
