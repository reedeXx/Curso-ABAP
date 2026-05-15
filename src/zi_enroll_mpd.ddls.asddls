@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definicion de enlistado'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_ENROLL_MPD as select from zenroll_mpd
-- Definición obligatoria del PARENT para la jerarquía BO
  association to parent ZI_STUDENT_MPD as _Student 
    on $projection.StudentId = _Student.StudentId
       
  association [1..1] to ZI_COURSE_MPD as _Course 
    on $projection.CourseId = _Course.CourseId
{
    key enroll_id  as EnrollId,
    student_id     as StudentId, -- Campo que vincula al Padre
    course_id      as CourseId,
    status         as Status,
      
    /* Exposición del Padre y del Maestro de Cursos */
    _Student,
    _Course
}
