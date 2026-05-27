CLASS zcl_primeraclasempd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRIMERACLASEMPD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

        Data lv_name type string value 'edro'.

        out->write( |Hola { lv_name } | ).

        data lv_decimal type p length 3 DECIMALS 2 value '333.33'.

        data(lv_gato) = 'miau'.

        data: lv_string TYPE string,
              lv_int type i,
              lv_fecha type d,
              lv_dec TYPE p LENGTH 8 DECIMALS 2 value '300.99',
              lv_car type c length 10 value 'experis'.

        lv_fecha = '20260512'.
        lv_string = '20260512'.

        out->write( lv_string ).
        out->write( lv_int ).
        out->write( lv_fecha ).
        out->write( lv_dec ).
        out->write( lv_car ).


  ENDMETHOD.
ENDCLASS.
