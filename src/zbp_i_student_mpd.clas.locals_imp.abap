CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Student RESULT result.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Student~validateEmail.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

    METHOD get_global_authorizations.
    ENDMETHOD.

    METHOD validateEmail.

      DATA(lv_email_regex) = `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`.

      "Leer los datos introducidos por el usuario usando las claves recibidas [5, 7]
      READ ENTITIES OF ZI_STUDENT_MPD IN LOCAL MODE
        ENTITY Student
        FIELDS ( Email ) WITH CORRESPONDING #( keys )
        RESULT DATA(students).

      LOOP AT students INTO DATA(student).
        IF student-Email IS INITIAL OR NOT matches( val = student-Email pcre = lv_email_regex ).

          " Si falla, se añade a la estructura 'failed' para bloquear el guardado [7, 8]
          APPEND VALUE #( %tky = student-%tky ) TO failed-student.
          " Se envía el mensaje de error a la estructura 'reported' para mostrarlo en la UI [8, 9]
          APPEND VALUE #( %tky = student-%tky
                          %msg = me->new_message( id = 'ZSTUDENT_MSG' number = '001' severity = if_abap_behv_message=>severity-error )
                          %element-email = if_abap_behv=>mk-on ) TO reported-student.
        ENDIF.
      ENDLOOP.

    ENDMETHOD.

ENDCLASS.
