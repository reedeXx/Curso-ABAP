CLASS zcl_ejercicio1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercicio1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES : BEGIN OF ty_flights,
              iduser   TYPE c LENGTH 40,
              aircode  type /dmo/carrier_id,
              flightnum TYPE /dmo/connection_id,
              key    TYPE land1,
              seat   TYPE /dmo/plane_seats_occupied,
              flightdate TYPE /dmo/flight_date,
            END of ty_flights.

    TYPES : BEGIN OF ty_airlines,
              aircode  type /dmo/carrier_id,
              flightnum TYPE /dmo/connection_id,
              cityfrom   TYPE /dmo/city,
              airpfrom   TYPE /dmo/airport_id,
              countryto TYPE land1,
            END of ty_airlines.

    TYPES: BEGIN OF ty_nested,
         flights  TYPE ty_flights,
         airlines TYPE ty_airlines,
    END OF ty_nested.

    TYPES: BEGIN OF ty_include,
         INCLUDE TYPE ty_flights,
         INCLUDING TYPE ty_airlines,
   END OF ty_include.

   " SEEDING

   DATA: ls_flight   TYPE ty_flights,
      ls_airline  TYPE ty_airlines,
      ls_nested   TYPE ty_nested,
      lt_flights  TYPE STANDARD TABLE OF ty_flights,
      lt_airlines TYPE STANDARD TABLE OF ty_airlines,
      lt_nested   TYPE STANDARD TABLE OF ty_nested,
      ls_include TYPE ty_include.

    ls_flight-iduser     = 'juan.perez'.
    ls_flight-aircode    = 'IB'.
    ls_flight-flightnum  = '1234'.
    ls_flight-key        = 'ES'.
    ls_flight-seat       = 14.
    ls_flight-flightdate = '20260514'.

    APPEND ls_flight TO lt_flights.

    ls_flight-iduser     = 'carlos.lopez'.
    ls_flight-aircode    = 'AF'.
    ls_flight-flightnum  = '5678'.
    ls_flight-key        = 'FR'.
    ls_flight-seat       = 8.
    ls_flight-flightdate = '20260516'.
    APPEND ls_flight TO lt_flights.

    ls_airline-aircode   = 'IB'.
    ls_airline-flightnum = '1234'.
    ls_airline-cityfrom  = 'Madrid'.
    ls_airline-airpfrom  = 'MAD'.
    ls_airline-countryto = 'ES'.
    APPEND ls_airline TO lt_airlines.

    ls_airline-aircode   = 'LH'.
    ls_airline-flightnum = '0400'.
    ls_airline-cityfrom  = 'Frankfurt'.
    ls_airline-airpfrom  = 'FRA'.
    ls_airline-countryto = 'DE'.
    APPEND ls_airline TO lt_airlines.

    ls_nested-flights-iduser     = 'ana.martinez'.
    ls_nested-flights-aircode    = 'IB'.
    ls_nested-flights-flightnum  = '1234'.
    ls_nested-flights-key        = 'ES'.
    ls_nested-flights-seat       = 3.
    ls_nested-flights-flightdate = '20260514'.

    ls_nested-airlines-aircode   = 'IB'.
    ls_nested-airlines-flightnum = '1234'.
    ls_nested-airlines-cityfrom  = 'Madrid'.
    ls_nested-airlines-airpfrom  = 'MAD'.
    ls_nested-airlines-countryto = 'ES'.

    APPEND ls_nested TO lt_nested.

  ENDMETHOD.
ENDCLASS.
