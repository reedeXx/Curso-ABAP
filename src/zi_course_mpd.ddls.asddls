@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definicion de curso'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_COURSE_MPD 
  as select from zcourse_mpd -- Tu tabla de base de datos física
  
  -- SUSTITUCIÓN: Usamos ON porque tu sistema no reconoce USING
  association [0..*] to ZI_ENROLL_MPD as _Enrollment 
    on $projection.CourseId = _Enrollment.CourseId
  
{
    key course_id    as CourseId, -- Campo clave con alias en CamelCase
    course_name     as CourseName,
    category        as Category,
    max_students    as MaxStudents,
    start_date      as StartDate,
    end_date        as EndDate,
    active          as isActive,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
     _Enrollment
   
}
