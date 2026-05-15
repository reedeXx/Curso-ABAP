@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definicion de curso'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_COURSE_MPD 
  as select from zcourse_mpd -- Tu tabla de base de datos física
{
    key course_id    as CourseId, -- Campo clave con alias en CamelCase
    course_name     as CourseName,
    category        as Category,
    max_students    as MaxStudents,
    start_date      as StartDate,
    end_date        as EndDate,
    
    -- Manejo del campo booleano
    active          as IsActive 
}
