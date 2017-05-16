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
  void set id(int v);
  void set firstName(String v);
  void set lastName(String v);
  void set email(String v);
  void set dateOfBirth(DateTime v);
  void set ssn(String v);

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
    }
    throwFieldNotFoundException(key, 'Person');
  }

  get keys => PersonClassMirror.fields.keys;
}

_Person__Constructor(params) => new Person();

const $$Person_fields_id = const DeclarationMirror(type: int);
const $$Person_fields_firstName = const DeclarationMirror(
    type: String,
    annotations: const [
      const Length(min: 2, max: null, customDescription: null)
    ]);
const $$Person_fields_lastName = const DeclarationMirror(
    type: String,
    annotations: const [
      const Length(min: 2, max: null, customDescription: null)
    ]);
const $$Person_fields_email = const DeclarationMirror(
    type: String,
    annotations: const [
      const ValidIf(isEmail, customDescription: r'The entered email is invalid')
    ]);
const $$Person_fields_dateOfBirth =
    const DeclarationMirror(type: DateTime, annotations: const [
  const ValidIf(lowerThanOrEqualNow,
      customDescription: r'Values after now are not allowed')
]);
const $$Person_fields_ssn = const DeclarationMirror(
    type: String,
    annotations: const [
      const ValidIf(isSSN, customDescription: r'The entered SSN is invalid')
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
  'ssn': $$Person_fields_ssn
}, getters: const [
  'id',
  'firstName',
  'lastName',
  'email',
  'dateOfBirth',
  'ssn'
], setters: const [
  'id',
  'firstName',
  'lastName',
  'email',
  'dateOfBirth',
  'ssn'
]);
