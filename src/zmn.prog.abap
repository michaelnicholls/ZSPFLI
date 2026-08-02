*&---------------------------------------------------------------------*
*& Report ZMN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMN.

with +sum  as ( select customid , sum( forcuram ) as curam , count( * ) as numbookings from sbook  group by customid )
select   from +sum as s left join scustom as c  on s~customid = c~id fields s~customid, c~name, s~curam, s~numbookings
order by s~curam DESCENDING INTO TABLE @data(m).
write: 'x'.
