CLASS zcl_mpd_generate_employees DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_mpd_generate_employees IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lt_employees TYPE TABLE OF zmpd_employee.

    " 1. Limpiar datos previos (opcional para pruebas limpias)
    DELETE FROM zmpd_employee.

    " 2. Definir datos de prueba usando la expresión VALUE #
    lt_employees = VALUE #(
      ( client = sy-mandt employee_id = '00000001' first_name = 'Juan' last_name = 'Pérez'
        birth_date = '19900515' entry_date = '20230101' annual_salary = '55000.00' currency_code = 'EUR' )
      ( client = sy-mandt employee_id = '00000002' first_name = 'Ana'  last_name = 'García'
        birth_date = '19851020' entry_date = '20220615' annual_salary = '62000.00' currency_code = 'EUR' )
    ).

    " 3. Insertar datos en la tabla de base de datos física
    INSERT zmpd_employee FROM TABLE @lt_employees.

    IF sy-subrc = 0.
      out->write( |Se han generado { sy-dbcnt } empleados con éxito.| ).
    ELSE.
      out->write( 'Error al insertar los datos.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
