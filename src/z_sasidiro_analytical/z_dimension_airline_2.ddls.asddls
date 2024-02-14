@AbapCatalog.sqlViewName: 'Z_AIRLINE_1'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline dimension'

@Analytics.dataCategory: #DIMENSION

define view Z_DIMENSION_AIRLINE_2  
as select from /dmo/carrier 
{
      @ObjectModel.text.element: [ 'AirlineName' ]
      key carrier_id   as Airline,
  
      @Semantics.text: true
      name as AirlineName,
      
      @Semantics.currencyCode: true
      currency_code as Currency
} 
