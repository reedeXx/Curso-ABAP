CLASS zcl_cadchars DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CADCHARS IMPLEMENTATION.


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

      " FUNCIONES DE PROCESAMIENTO

      DATA lv_cad TYPE string VALUE 'Hola, este es el curso de ABAP'.

      DATA lv_num1 TYPE i VALUE 5.
      DATA lv_num2 TYPE i VALUE 10.
      DATA lv_resultado TYPE i.

      out->write( | { lv_cad  }mayusculas = { to_upper( lv_cad ) } | ).

      out->write( | { lv_cad  }minusculas = { to_lower( lv_cad ) } | ).

      out->write( | { lv_cad  }encriptamiento = { reverse( lv_cad ) } | ).

      out->write( | { lv_cad  } shift_left = { shift_left( val = lv_cad places = 5 ) } | ).

      out->write( | { lv_cad  } shift_right = { shift_right( val = lv_cad places = 5 ) } | ).

      out->write( | { lv_cad  } substring = { substring( val = lv_cad off = 5 len = 6 ) } | ).

      out->write( | { lv_cad  } substring_from = { substring_from( val = lv_cad sub = 'el' ) } | ).

      out->write( | { lv_cad  } substring_after = { substring_after( val = lv_cad sub = 'el'  ) } | ).

      out->write( | { lv_cad  } substring_before = { substring_before( val = lv_cad sub = 'el'  ) } | ).

      out->write( | { lv_cad  } condense = { condense( lv_cad ) } | ).

      out->write( | { lv_cad  } replace = { replace( val = lv_cad sub = 'el' with = 'la' ) } | ).

      out->write( | { lv_cad  } replace_regex = { replace( val = lv_cad regex = 'el' with = 'la' ) } | ).

      "out->write( | { lv_cad  } trim = { trim( lv_cad ) } | ).

      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " funciones de contenido
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      data: lv_text type string,
            lv_pattern type string.
            lv_text = ' the employees number is: 123-456-7890 '.
            lv_pattern = '\d{3}-\d{3}-\d{4}'.


      if contains( val = lv_text pcre = lv_pattern ).
          out->write( 'Contiene numero' ).
          data(lv_count) = count( val = lv_text pcre = lv_pattern ).
          out->write( lv_count ).
          data(lv_number) = match( val = lv_text pcre = lv_pattern occ = 1 ).
          out->write( lv_number ).
      else.
          out->write( 'No se ha encontrado correo' ).
      ENDIF.

  ENDMETHOD.
ENDCLASS.
