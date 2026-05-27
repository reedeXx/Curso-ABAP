CLASS lhc_enroll DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validateMaxStudents FOR VALIDATE ON SAVE
      IMPORTING keys FOR Enroll~validateMaxStudents.

ENDCLASS.

CLASS lhc_enroll IMPLEMENTATION.

    METHOD validateMaxStudents.
      " 1. Lectura de las inscripciones entrantes (LOCAL MODE es permitido aquí porque es su propio BO) [1, 2]
      READ ENTITIES OF zi_student_mpd IN LOCAL MODE
        ENTITY Enroll
          FIELDS ( CourseId )
          WITH CORRESPONDING #( keys )
        RESULT DATA(lt_enrollments).

      " 2. Procesamiento masivo de los registros mediante un LOOP [3, 4]
      LOOP AT lt_enrollments INTO DATA(ls_enrollment).

        " 3. Lectura del Business Object externo: Cursos (SIN 'IN LOCAL MODE')
        " Esto evita el error de permisos del compilador al cruzar BOs [Historial de conversación]
        READ ENTITIES OF zi_course_mpd
          ENTITY Course
            FIELDS ( MaxStudents )
            WITH VALUE #( ( CourseId = ls_enrollment-CourseId ) )
          RESULT DATA(lt_courses).

        " Verificamos que el curso exista antes de continuar
        CHECK lt_courses IS NOT INITIAL.
        DATA(lv_max_students) = lt_courses[ 1 ]-MaxStudents.

        " 4. Conteo de alumnos ya inscritos en la persistencia [3, 5]
        SELECT COUNT( * )
          FROM zenroll_mpd
          WHERE course_id = @ls_enrollment-CourseId
          INTO @DATA(lv_current_enrollments).

        " 5. Lógica de validación de cupo
        IF lv_current_enrollments >= lv_max_students.

          " A. Informar al framework que el registro específico ha fallado [6, 7]
          " Usamos %tky para asegurar la compatibilidad con escenarios de borrador (Draft) [8, 9]
          APPEND VALUE #( %tky = ls_enrollment-%tky ) TO failed-enroll.

          " B. Notificar el mensaje de error para la interfaz de usuario [10, 11]
          " El sufijo '-enrollment' debe coincidir exactamente con el alias en la BDEF [Historial de conversación]
          APPEND VALUE #( %tky            = ls_enrollment-%tky
                          %msg            = new_message_with_text(
                                              severity = if_abap_behv_message=>severity-error
                                              text     = |El curso { ls_enrollment-CourseId } está lleno (Cupo: { lv_max_students })| )
                          %element-courseid = if_abap_behv=>mk-on " Resalta el campo en la UI [10, 11]
                        ) TO reported-enroll.
        ENDIF.

      ENDLOOP.
    ENDMETHOD.

ENDCLASS.

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
