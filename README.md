# drails_validator

[![Build Status](https://travis-ci.org/drails-dart/drails_validator.svg)](https://travis-ci.org/drails-dart/drails_validator.svg)

Library for validate models similar to JPA Bean validation. It provides a way to validate a dart object using constraints which we can use for validation. To check if the object is valid we need to invoke the function `validate` this one returns an Object of type `ValidationResult` which contains a map of errors for every attribute of the object, for example:

```dart

library Validator.example;

import 'package:validator/validator.dart' as validator;
import 'package:drails_validator/drails_validator.dart';

bool lowerThanOrEqualNow(DateTime dateOfBirth) =>
  !dateOfBirth.isAfter(new DateTime.now());

bool isEmail(String email) =>
    isNotNull(email) && validator.isEmail(email);

@validable
class Person {
  int id;
  
  @Length(min: 2)
  String firstName;
  
  @Length(min: 2)
  String lastName;
  
  @ValidIf(isEmail, customDescription: 'The entered email is invalid')
  String email;
  
  @ValidIf(lowerThanOrEqualNow, customDescription: 'Values after now are not allowed')
  DateTime dateOfBirth;
  
  @Matches(r'\d\d\d-\d\d-\d\d\d\d', customDescription: 'The entered SSN is invalid')
  String ssn;
}

main() {
  var invalidPerson = new Person()
        ..id = 1
        ..firstName = ''
        ..lastName = ''
        ..dateOfBirth = new DateTime(2030, 11, 9)
        ..ssn = '123',
      validPerson = new Person()
        ..id = 2
        ..firstName = 'Joe'
        ..lastName = 'Doe'
        ..email = 'joedoe@email.com'
        ..dateOfBirth = new DateTime(1989, 11, 9)
        ..ssn = '123-45-6789';
        
  print('invalidPerson: ${validate(invalidPerson)}');
  print('validPerson: ${validate(validPerson)}');
  /*
  will print:
    invalidPerson: 
      isValid: false,
      errors: {
        firstName: [Length should be greather than 2],
        lastName: [Length should be greather than 2], 
        email: [The entered email is invalid], 
        dateOfBirth: [Values after now are not allowed], 
        ssn: [The entered SSN is invalid]
      }
    validPerson: isValid: true, errors: {}
  */
}
```
