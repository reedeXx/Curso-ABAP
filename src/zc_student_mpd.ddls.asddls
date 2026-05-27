@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección de Estudiantes'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_STUDENT_MPD
  provider contract transactional_query -- Contrato obligatorio para proyecciones de BO
  as projection on ZI_STUDENT_MPD
{
    @EndUserText.label: 'ID Estudiante'
    key StudentId,
    @EndUserText.label: 'Nombre'
    FirstName,
    
    @EndUserText.label: 'Apellido'
    LastName,
    
    @EndUserText.label: 'Correo Electrónico'
    Email,
    
    @EndUserText.label: 'Fecha de Nacimiento'
    BirthDate,
    
    @EndUserText.label: 'Fecha Registro'
    CreatedAt,
    
    @EndUserText.label: 'Creado por'
    CreatedBy,
    
    _Enrollment : redirected to composition child ZC_ENROLL_MPD 

}
