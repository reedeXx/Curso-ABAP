@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección cursos'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_COURSE_MPD
provider contract transactional_query 
as projection on ZI_COURSE_MPD
{
    @EndUserText.label: 'ID Curso'
    key CourseId,
    @EndUserText.label: 'Nombre del Curso'
    CourseName,
    
    @EndUserText.label: 'Categoría'
    Category,
    
    @EndUserText.label: 'Capacidad Máxima'
    MaxStudents,
    
    @EndUserText.label: 'Fecha Inicio'
    StartDate,
    
    @EndUserText.label: 'Fecha Fin'
    EndDate,
    
    @EndUserText.label: 'Estado Activo'
    isActive,
    
    _Enrollment
}
