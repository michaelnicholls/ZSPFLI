@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'next flight'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z_nextflight as select from sflight join spfli on sflight.carrid = spfli.carrid and sflight.connid = spfli.connid
{
    key sflight.carrid as Carrid,
    key sflight.connid as Connid,
    @EndUserText.label: 'Next flight date'
    min(sflight.fldate) as nextdate
} 
where sflight.fldate >= $session.system_date 
group by sflight.carrid, sflight.connid
