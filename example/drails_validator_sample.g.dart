// GENERATED CODE - DO NOT MODIFY BY HAND

part of Validator.example;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library Validator.example
// **************************************************************************

_initMirrors() {
  initClassMirrors({Person: PersonClassMirror});
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: DsonGenerator
// Target: class Person
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

  operator [](Object key) {
    switch (key) {
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
    throwFieldNotFoundException(key, 'Person');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'id':
        id = value;
        return;
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
      case 'email':
        email = value;
        return;
      case 'dateOfBirth':
        dateOfBirth = value;
        return;
      case 'ssn':
        ssn = value;
        return;
      case 'fieldA':
        fieldA = value;
        return;
      case 'fieldB':
        fieldB = value;
        return;
    }
    throwFieldNotFoundException(key, 'Person');
  }

  Iterable<String> get keys => PersonClassMirror.fields.keys;
}

_Person__Constructor(params) => new Person();

const $$Person_fields_id = const DeclarationMirror(type: int);
const $$Person_fields_firstName = const DeclarationMirror(
    type: String,
    annotations: const [const Length(min: 2, max: null, description: null)]);
const $$Person_fields_lastName = const DeclarationMirror(
    type: String,
    annotations: const [const Length(min: 2, max: null, description: null)]);
const $$Person_fields_email = const DeclarationMirror(
    type: String,
    annotations: const [
      const ValidIf(isEmail,
          description: r'The entered email is invalid', iff: null)
    ]);
const $$Person_fields_dateOfBirth =
    const DeclarationMirror(type: DateTime, annotations: const [
  const ValidIf(lowerThanOrEqualNow,
      description: r'Values after now are not allowed', iff: null)
]);
const $$Person_fields_ssn =
    const DeclarationMirror(type: String, annotations: const [
  const ValidIf(isSSN, description: r'The entered SSN is invalid', iff: null)
]);
const $$Person_fields_fieldA = const DeclarationMirror(type: int);
const $$Person_fields_fieldB =
    const DeclarationMirror(type: int, annotations: const [
  const NotNull(
      description: r'fieldB should not be null if fieldA is greater than 123',
      iff: _fieldAGt123)
]);

const PersonClassMirror =
    const ClassMirror(name: 'Person', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _Person__Constructor)
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
