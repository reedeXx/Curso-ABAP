@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZMPD_EMPLOYEE'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_MPD_EMPLOYEE
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_MPD_EMPLOYEE
  association [1..1] to ZR_MPD_EMPLOYEE as _BaseEntity on $projection.EMPLOYEEID = _BaseEntity.EMPLOYEEID
{
  key EmployeeID,
  FirstName,
  LastName,
  BirthDate,
  EntryDate,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  AnnualSalary,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
