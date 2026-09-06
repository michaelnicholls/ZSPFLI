@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'my customers'
define root view entity z_c_mycustomers as projection on  Z_I_MYCUSTOMERS
{
      @UI.lineItem:  [{ position: 10 }]
 
   key  id,
      @UI.lineItem: [{ position: 20 }]
 
    name,
       @UI.lineItem: [{ position: 30 }]
 
    form,
       @UI.lineItem: [{ position: 40 }]
 
    street,
       @UI.lineItem: [{ position: 50 }]
 
    postbox,
    postcode,
    @UI.lineItem: [{ position: 60 }]
    city,
    @UI.lineItem: [{ position: 70 }]
    country,
    region,
    telephone,
    custtype,
    discount,
    langu,
    email,
    webuser
    }
