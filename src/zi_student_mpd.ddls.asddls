@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definicion de estudiantes'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_STUDENT_MPD as select from zstudent_mpd
  -- Relación: Un estudiante puede tener muchas inscripciones
  composition [0..*] of ZI_ENROLL_MPD as _Enrollment 
{   
    key student_id as StudentId,
    first_name     as FirstName,
    last_name      as LastName,
    email          as Email,
    birth_date     as BirthDate,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,      
    /* Exposición de la composición para el framework RAP */
    _Enrollment 
}
