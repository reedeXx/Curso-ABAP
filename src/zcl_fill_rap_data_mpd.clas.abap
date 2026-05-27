CLASS zcl_fill_rap_data_mpd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_rap_data_mpd IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcourse_mpd_d.
    COMMIT WORK.

*    DELETE FROM zstudent_mpd.
*    DELETE FROM zcourse_mpd.
*    DELETE FROM zenroll_mpd.

*
*    INSERT zstudent_mpd FROM TABLE @( VALUE #(
*
*    ( student_id = '00001'
*      first_name = 'Luis'
*      last_name  = 'Maldonado'
*      email      = 'luis@test.com'
*      birth_date = '19991210'
*      created_at = cl_abap_context_info=>get_system_date( )
*      created_by = sy-uname )
*
*    ( student_id = '00002'
*      first_name = 'Carlos'
*      last_name  = 'Ruiz'
*      email      = 'carlos@test.com'
*      birth_date = '20010315'
*      created_at = cl_abap_context_info=>get_system_date( )
*      created_by = sy-uname )
*
*    ( student_id = '00003'
*      first_name = 'Marta'
*      last_name  = 'Lopez'
*      email      = 'marta@test.com'
*      birth_date = '20000720'
*      created_at = cl_abap_context_info=>get_system_date( )
*      created_by = sy-uname )
*
*    ( student_id = '00004'
*      first_name = 'Lucia'
*      last_name  = 'Fernandez'
*      email      = 'lucia@test.com'
*      birth_date = '19981102'
*      created_at = cl_abap_context_info=>get_system_date( )
*      created_by = sy-uname )
*
*    ( student_id = '00005'
*      first_name = 'Pablo'
*      last_name  = 'Sanchez'
*      email      = 'pablo@test.com'
*      birth_date = '20020201'
*      created_at = cl_abap_context_info=>get_system_date( )
*      created_by = sy-uname )
*
*    ( student_id = '00006'
*      first_name = 'Elena'
*      last_name  = 'Garcia'
*      email      = 'elena@test.com'
*      birth_date = '19970514'
*      created_at = cl_abap_context_info=>get_system_date( )
*      created_by = sy-uname )
*
*    ) ).
*
**---------------------------------------
** CURSOS
**---------------------------------------
*
*    INSERT zcourse_mpd FROM TABLE @( VALUE #(
*
*    ( course_id     = '00001'
*      course_name   = 'ABAP Basics'
*      category      = 'SAP'
*      max_students  = 30
*      start_date    = '20260601'
*      end_date      = '20260701'
*      active        = 'X' )
*
*    ( course_id     = '00002'
*      course_name   = 'CDS Views'
*      category      = 'SAP'
*      max_students  = 20
*      start_date    = '20260610'
*      end_date      = '20260720'
*      active        = 'X' )
*
*    ( course_id     = '00003'
*      course_name   = 'RAP Development'
*      category      = 'SAP'
*      max_students  = 15
*      start_date    = '20260701'
*      end_date      = '20260815'
*      active        = 'X' )
*
*    ( course_id     = '00004'
*      course_name   = 'SQL Advanced'
*      category      = 'DATABASE'
*      max_students  = 25
*      start_date    = '20260520'
*      end_date      = '20260630'
*      active        = 'X' )
*
*    ) ).
*
**---------------------------------------
** INSCRIPCIONES
**---------------------------------------
*
*    INSERT zenroll_mpd FROM TABLE @( VALUE #(
*
*    ( enroll_id   = '000001'
*      student_id  = '00001'
*      course_id   = '00001'
*      enroll_date = '20260501'
*      status      = 'ACTIVE' )
*
*    ( enroll_id   = '000002'
*      student_id  = '00002'
*      course_id   = '00001'
*      enroll_date = '20260502'
*      status      = 'ACTIVE' )
*
*    ( enroll_id   = '000003'
*      student_id  = '00003'
*      course_id   = '00002'
*      enroll_date = '20260503'
*      status      = 'ACTIVE' )
*
*    ( enroll_id   = '000004'
*      student_id  = '00004'
*      course_id   = '00003'
*      enroll_date = '20260504'
*      status      = 'FINISHED' )
*
*    ( enroll_id   = '000005'
*      student_id  = '00005'
*      course_id   = '00002'
*      enroll_date = '20260505'
*      status      = 'CANCELLED' )
*
*    ( enroll_id   = '000006'
*      student_id  = '00006'
*      course_id   = '00004'
*      enroll_date = '20260506'
*      status      = 'ACTIVE' )
*
*    ) ).
*
*    COMMIT WORK.
*
*    out->write( 'Datos insertados correctamente' ).
**********************************************************************
  ENDMETHOD.
ENDCLASS.
