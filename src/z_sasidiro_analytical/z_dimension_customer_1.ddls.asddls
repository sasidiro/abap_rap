@AbapCatalog.sqlViewName: 'Z_CUSTOMER_1'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Customer'

@Analytics.dataCategory: #DIMENSION

define view z_dimension_customer_1
  as select from /dmo/customer
  association [0..1] to I_Country as _Country on $projection.Country = _Country.Country
{
      @ObjectModel.text.element: [ 'CustomerName' ]
  key customer_id                     as Customer,

      @Semantics.text: true
      concat( first_name,
              concat( ' ', last_name)) as CustomerName,

      @ObjectModel.foreignKey.association: '_Country'
      @Semantics.address.country: true
      country_code                    as Country,

      @Semantics.address.city: true
      city                            as City,

      _Country
}


