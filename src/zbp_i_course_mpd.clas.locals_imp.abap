CLASS lhc_Course DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Course RESULT result.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Course~validateDates.

ENDCLASS.

CLASS lhc_Course IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateDates.

    READ ENTITIES OF ZI_COURSE_MPD IN LOCAL MODE
    ENTITY Course
    FIELDS ( StartDate EndDate ) WITH CORRESPONDING #( keys )
    RESULT DATA(courses).

    LOOP AT courses INTO DATA(course).
        IF course-EndDate < course-StartDate.
          APPEND VALUE #( %tky = course-%tky ) TO failed-course.
          APPEND VALUE #( %tky = course-%tky
                          %msg = me->new_message( id = 'ZSTUDENT_MSG' number = '003' severity = if_abap_behv_message=>severity-error )
                          %element-enddate = if_abap_behv=>mk-on ) TO reported-course.
        ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
