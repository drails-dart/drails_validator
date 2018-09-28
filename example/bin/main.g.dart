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
