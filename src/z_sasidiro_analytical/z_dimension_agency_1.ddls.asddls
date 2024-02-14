@AbapCatalog.sqlViewName: 'Z_TRVAGENCY_1'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Agency'

@Analytics.dataCategory: #DIMENSION

define view Z_Dimension_Agency_1
  as select from /dmo/agency 
  association [0..1] to I_Country as _Country on $projection.Country = _Country.Country
{
      @ObjectModel.text.element: [ 'TravelAgencyName' ]
  key agency_id as TravelAgency,

      @Semantics.text: true
      name      as TravelAgencyName,

      @ObjectModel.foreignKey.association: '_Country'
      @Semantics.address.country: true
      _Country.Country  as Country,

      @Semantics.address.city: true
      city      as City,
      
      _Country
} 
