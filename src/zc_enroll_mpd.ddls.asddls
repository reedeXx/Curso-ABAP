@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección enlistamiento'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_ENROLL_MPD 
as projection on ZI_ENROLL_MPD
{
    @EndUserText.label: 'ID Inscripcion'
    key EnrollId,
    @EndUserText.label: 'ID Curso'
    @Consumption.valueHelpDefinition: [ {
        entity: {
          name:    'ZC_COURSE_MPD',
          element: 'CourseId'
        }
    } ]
    CourseId,
    @EndUserText.label: 'ID Estudiante'
    StudentId,
    @EndUserText.label: 'Fecha de inscripción'
    EnrollDate,
    @EndUserText.label: 'Fecha de estado'
    Status,
    _Course,
    _Student: redirected to parent ZC_STUDENT_MPD
    
}
