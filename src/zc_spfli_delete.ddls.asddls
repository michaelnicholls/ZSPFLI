@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'delete?'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SPFLI_delete as select distinct  from zspfli
{
    key Carrid
}
