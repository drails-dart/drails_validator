![Build
Status](https://travis-ci.org/drails-dart/drails_validator.svg?branch=master)

Library for validate models similar to JPA Bean validation. It provides
a way to validate a dart object using constraints which we can use for
validation. To check if the object is valid we need to invoke the
function `validate` which returns an Object of type `ValidationResult`
which contains a map of errors for every attribute of the object, for
example:

  - Create a new dart project

  - Add dependencies to `pubspec.yaml`

<!-- end list -->

``` yaml
...
dependencies:
  ...
  drails_validator: ^0.1.0 #change it for the latest version
  ...

dev_dependencies:
  ...
  build_runner: any
  ...
```

  - Create/edit the file `main.dart` in the folder `bin` and put next
    code on
it:

<!-- end list -->

``` dart
// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.example;

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
```

  - run `pub run build_runner build`. Then you will see that the file
    `bin/drails_validator_sample.g.dart` has been generated and it will
    contains the next code:

<!-- end list -->

``` dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of Validator.example;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$PersonSerializable extends SerializableMap {
  int get id;
  String get firstName;
  String get lastName;
  String get email;
  DateTime get dateOfBirth;
  String get ssn;
  int get fieldA;
  int get fieldB;
  void set id(int v);
  void set firstName(String v);
  void set lastName(String v);
  void set email(String v);
  void set dateOfBirth(DateTime v);
  void set ssn(String v);
  void set fieldA(int v);
  void set fieldB(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'firstName':
        return firstName;
      case 'lastName':
        return lastName;
      case 'email':
        return email;
      case 'dateOfBirth':
        return dateOfBirth;
      case 'ssn':
        return ssn;
      case 'fieldA':
        return fieldA;
      case 'fieldB':
        return fieldB;
    }
    throwFieldNotFoundException(__key, 'Person');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'firstName':
        firstName = __value;
        return;
      case 'lastName':
        lastName = __value;
        return;
      case 'email':
        email = __value;
        return;
      case 'dateOfBirth':
        dateOfBirth = fromSerializedDateTime(__value);
        return;
      case 'ssn':
        ssn = __value;
        return;
      case 'fieldA':
        fieldA = __value;
        return;
      case 'fieldB':
        fieldB = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Person');
  }

  Iterable<String> get keys => PersonClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_Person__Constructor([positionalParams, namedParams]) => new Person();

const $$Person_fields_id = const DeclarationMirror(name: 'id', type: int);
const $$Person_fields_firstName = const DeclarationMirror(
    name: 'firstName',
    type: String,
    annotations: const [
      const Length(min: 2, max: null, description: lengthShouldBeBetweenMessage)
    ]);
const $$Person_fields_lastName = const DeclarationMirror(
    name: 'lastName',
    type: String,
    annotations: const [
      const Length(min: 2, max: null, description: lengthShouldBeBetweenMessage)
    ]);
const $$Person_fields_email = const DeclarationMirror(
    name: 'email',
    type: String,
    annotations: const [
      const ValidIf(isEmail, description: enteredEmailInvalidMessage, iff: null)
    ]);
const $$Person_fields_dateOfBirth = const DeclarationMirror(
    name: 'dateOfBirth',
    type: DateTime,
    annotations: const [
      const ValidIf(lowerThanOrEqualNow,
          description: valueAfterNowAreNotAllowedMessage, iff: null)
    ]);
const $$Person_fields_ssn = const DeclarationMirror(
    name: 'ssn',
    type: String,
    annotations: const [
      const ValidIf(isSSN, description: enteredSSNInvalidMessage, iff: null)
    ]);
const $$Person_fields_fieldA =
    const DeclarationMirror(name: 'fieldA', type: int);
const $$Person_fields_fieldB =
    const DeclarationMirror(name: 'fieldB', type: int, annotations: const [
  const NotNull(
      description: fieldBShouldNotBeNullIfFieldAGt123Message, iff: _fieldAGt123)
]);

const PersonClassMirror =
    const ClassMirror(name: 'Person', constructors: const {
  '': const FunctionMirror(name: '', $call: _Person__Constructor)
}, fields: const {
  'id': $$Person_fields_id,
  'firstName': $$Person_fields_firstName,
  'lastName': $$Person_fields_lastName,
  'email': $$Person_fields_email,
  'dateOfBirth': $$Person_fields_dateOfBirth,
  'ssn': $$Person_fields_ssn,
  'fieldA': $$Person_fields_fieldA,
  'fieldB': $$Person_fields_fieldB
}, getters: const [
  'id',
  'firstName',
  'lastName',
  'email',
  'dateOfBirth',
  'ssn',
  'fieldA',
  'fieldB'
], setters: const [
  'id',
  'firstName',
  'lastName',
  'email',
  'dateOfBirth',
  'ssn',
  'fieldA',
  'fieldB'
]);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({Person: PersonClassMirror});
}
```

  - Finally you can run the file `bin/drails_validator_sample.dart`. If
    everything is ok you will see next output in
    console:

<!-- end list -->

    invalidPerson: isValid: false, errors: {firstName: [Length should be greather than 2], lastName: [Length should be greather than 2], email: [The entered email is invalid], dateOfBirth: [Values after now are not allowed], ssn: [The entered SSN is invalid]}
    validPerson: isValid: true, errors: {}

# Add Localization

  - install `l10n` package by running:

<!-- end list -->

    pub global activate l10n

  - generate translations by running:

<!-- end list -->

    mkl10n -l es . <path-to-drails_validator-package>

> **Warning**
> 
> Remember to replace `<path-to-drails_validator-package>` by the
> correct path

  - translate `intl_es.arb` file using [Google Translate
    Toolkit](https://translate.google.com/toolkit)

  - run again:

<!-- end list -->

    mkl10n -l es . <path-to-drails_validator-package>

  - import the generated `messages_all.dart` file in the `main.dart`
    file:

<!-- end list -->

``` dart
import 'package:drails_validator_example/_l10n/messages_all.dart';
```

then set the default locale and initialize the messages by adding next
code to main function:

``` dart
main() {
...
  Intl.defaultLocale = 'es';
  await initializeMessages('es');
...
}
```

final code in
`main.dart`:

``` dart
// Copyright (c) 2015, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.example;

import 'package:drails_validator_example/_l10n/messages_all.dart';
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

  Intl.defaultLocale = 'es';
  await initializeMessages('es');

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
```

# Edit the README file

Please don’t edit the `README.md` file since this one is generated by
`asciidoctor` and `pandoc`. Instead edit `_README.adoc` and then run:

    asciidoctor _README.adoc

and then:

    pandoc -f docbook -t gfm -o README.md _README.adoc
