@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'add?'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SPFLI_ADD as select distinct  from zspfli
{
    key Carrid
}
