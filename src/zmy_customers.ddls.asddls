@EndUserText.label: 'customers by AMDP'
define table function Zmy_CUSTOMERS
returns {
 key mandt : abap.clnt;
 key id : s_customer;
  name : s_custname;
    form      : s_form;
  street    : s_street  ;
  postbox   : s_postbox  ;
  postcode  : postcode  ;
  city      : city  ;
  country   : s_country  ;
  region    : s_region  ;
  telephone : s_phoneno  ;
  custtype  : s_custtype  ;
  discount  : s_discount  ;
  langu     : spras  
;
  email     : s_email  ;
  webuser   : s_webname  ;
  
  
}
implemented by method zmn_demo=>GET_MY_FUNCTION_DATA
