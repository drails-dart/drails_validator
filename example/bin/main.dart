// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.example;

// tag::import-messages[]
import 'package:drails_validator_example/_l10n/messages_all.dart';
// end::import-messages[]
import 'package:intl/intl.dart';
import 'package:validators/validators.dart' as validator;
import 'package:drails_validator/drails_validator.dart';

part 'main.g.dart';

enteredEmailInvalidMessage() =>
    Intl.message('The entered email is invalid', name: 'enteredEmailInvalidMessage');

valueAfterNowAreNotAllowedMessage() => Intl.message('Values after now are not allowed', name: 'valueAfterNowAreNotAllowedMessage');

enteredSSNInvalidMessage() => Intl.message('The entered SSN is invalid', name: 'enteredSSNInvalidMessage');

fieldBShouldNotBeNullIfFieldAGt123Message() => Intl.message("fieldB should not be null if fieldA is greater than 123", name: 'fieldBShouldNotBeNullIfFieldAGt123Message');

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

  @ValidIf(isEmail, description: enteredEmailInvalidMessage)
  String email;

  @ValidIf(lowerThanOrEqualNow, description: valueAfterNowAreNotAllowedMessage)
  DateTime dateOfBirth;

  @ValidIf(isSSN, description: enteredSSNInvalidMessage)
  String ssn;

  int fieldA;

  @NotNull(iff: _fieldAGt123, description: fieldBShouldNotBeNullIfFieldAGt123Message)
  int fieldB;
}

main() async {
  _initMirrors();

  // tag::set-locale[]
  Intl.defaultLocale = 'es';
  await initializeMessages('es');
  // end::set-locale[]

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
