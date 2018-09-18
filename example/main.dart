// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.example;

import 'package:validators/validators.dart' as validator;
import 'package:drails_validator/drails_validator.dart';

part 'main.g.dart';

bool lowerThanOrEqualNow(DateTime dateOfBirth) => !dateOfBirth.isAfter(new DateTime.now());

bool isSSN(String ssn) => validator.matches(ssn, r'\d\d\d-\d\d-\d\d\d\d');

bool isEmail(String email) => isNotNull(email) && validator.isEmail(email);

_fieldAGt123(Person p) => p.fieldA != null && p.fieldA > 123;

@serializable
class Person extends _$PersonSerializable {
  int id;

  @Length(min: 2)
  String firstName;

  @Length(min: 2)
  String lastName;

  @ValidIf(isEmail, description: 'The entered email is invalid')
  String email;

  @ValidIf(lowerThanOrEqualNow, description: 'Values after now are not allowed')
  DateTime dateOfBirth;

  @ValidIf(isSSN, description: 'The entered SSN is invalid')
  String ssn;

  int fieldA;

  @NotNull(iff: _fieldAGt123, description: "fieldB should not be null if fieldA is greater than 123")
  int fieldB;
}

main() {
  _initMirrors();

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
}
