@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales order for a material'
@Metadata.ignorePropagatedAnnotations: true
define view entity zmn_so_for_mat as select distinct from ZMN_I_SALESDOC
{
    key Product,
    key SalesDocument
    } 
