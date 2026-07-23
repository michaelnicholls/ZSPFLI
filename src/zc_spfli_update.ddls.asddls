@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'update?'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SPFLI_update as select distinct  from zspfli
{
    key Carrid
}
