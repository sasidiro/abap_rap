@AbapCatalog.sqlViewName: 'Z_CONNECTION'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Connection'

@Analytics.dataCategory: #DIMENSION

@ObjectModel.representativeKey: 'FlightConnection'

define view Z_Dimension_Connection_1
  as select from /dmo/connection
  association [0..1] to Z_DIMENSION_AIRLINE_2 as _Airline on $projection.Airline = _Airline.Airline
{
      @ObjectModel.foreignKey.association: '_Airline'
  key carrier_id                    as Airline,

      @ObjectModel.text.element: [ 'Destination' ]
  key connection_id                   as FlightConnection,

      @Semantics.text: true
      concat( airport_from_id,
        concat(' -> ', airport_to_id)) as Destination,

      _Airline
} 
