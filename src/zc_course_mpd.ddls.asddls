@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección cursos'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_COURSE_MPD
provider contract transactional_query 
as projection on ZI_COURSE_MPD
{
    key CourseId,
    CourseName,
    Category,
    MaxStudents,
    StartDate,
    EndDate,
    IsActive
}
