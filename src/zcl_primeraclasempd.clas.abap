CLASS zcl_primeraclasempd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primeraclasempd IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

        Data lv_name type string value 'edro'.

        out->write( |Hola { lv_name } | ).

  ENDMETHOD.

ENDCLASS.
