@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'my customers'
define root view entity Z_I_MYCUSTOMERS as select from Zmy_CUSTOMERS
{
   key  id,
    name,
    form,
    street,
    postbox,
    postcode,
    city,
    country,
    region,
    telephone,
    custtype,
    discount,
    langu,
    email,
    webuser
    }
