CLASS zcl_cadchars DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cadchars IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      "DATA(lv_num) = strlen( ' daniel ' ). " cuenta caracteres
      " numofchar() no tiene en cuenta espacios en blanco

      DATA lv_var type string value 'experis experis'.

      DATA(lv_num) = count( val = lv_var sub = 'ex' ). "FORMA CONTIGUA

      lv_num = count_any_of( val = lv_var sub = 'ex' ).

      lv_num = count_any_not_of( val = lv_var sub = 'ex' ).

      lv_num = find( val = lv_var sub = 'is' ).

      lv_num = find_any_of( val = lv_var sub = 'is' ). "Forma no contigua

      lv_num = find_any_not_of( val = lv_var sub = 'is' ).

      out->write( lv_num ).

  ENDMETHOD.
ENDCLASS.
