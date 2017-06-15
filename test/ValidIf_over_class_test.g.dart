// GENERATED CODE - DO NOT MODIFY BY HAND

part of ValidIf_over_class;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library ValidIf_over_class
// **************************************************************************

_initMirrors() {
  initClassMirrors(
      {ObjectWithValidIfOverClass: ObjectWithValidIfOverClassClassMirror});
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithValidIfOverClass
// **************************************************************************

abstract class _$ObjectWithValidIfOverClassSerializable
    extends SerializableMap {
  String get firstName;
  String get lastName;
  void set firstName(String v);
  void set lastName(String v);

  operator [](Object key) {
    switch (key) {
      case 'firstName':
        return firstName;
      case 'lastName':
        return lastName;
    }
    throwFieldNotFoundException(key, 'ObjectWithValidIfOverClass');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithValidIfOverClass');
  }

  Iterable<String> get keys =>
      ObjectWithValidIfOverClassClassMirror.fields.keys;
}

_ObjectWithValidIfOverClass__Constructor(params) =>
    new ObjectWithValidIfOverClass();

const $$ObjectWithValidIfOverClass_fields_firstName =
    const DeclarationMirror(type: String);
const $$ObjectWithValidIfOverClass_fields_lastName =
    const DeclarationMirror(type: String);

const ObjectWithValidIfOverClassClassMirror =
    const ClassMirror(name: 'ObjectWithValidIfOverClass', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithValidIfOverClass__Constructor)
}, annotations: const [
  const ValidIf(_firstNameAndLastNameAreDifferent, description: null, iff: null)
], fields: const {
  'firstName': $$ObjectWithValidIfOverClass_fields_firstName,
  'lastName': $$ObjectWithValidIfOverClass_fields_lastName
}, getters: const [
  'firstName',
  'lastName'
], setters: const [
  'firstName',
  'lastName'
]);
