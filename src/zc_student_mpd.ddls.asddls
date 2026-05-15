@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección de Estudiantes'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_STUDENT_MPD
  provider contract transactional_query -- Contrato obligatorio para proyecciones de BO
  as projection on ZI_STUDENT_MPD
{
    key StudentId,
    FirstName,
    LastName,
    Email,
    BirthDate
}
