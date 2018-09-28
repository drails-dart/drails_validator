// GENERATED CODE - DO NOT MODIFY BY HAND

part of ValidIf_over_class;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$ObjectWithValidIfOverClassSerializable
    extends SerializableMap {
  String get firstName;
  String get lastName;
  void set firstName(String v);
  void set lastName(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'firstName':
        return firstName;
      case 'lastName':
        return lastName;
    }
    throwFieldNotFoundException(__key, 'ObjectWithValidIfOverClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'firstName':
        firstName = __value;
        return;
      case 'lastName':
        lastName = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithValidIfOverClass');
  }

  Iterable<String> get keys =>
      ObjectWithValidIfOverClassClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ObjectWithValidIfOverClass__Constructor([positionalParams, namedParams]) =>
    new ObjectWithValidIfOverClass();

const $$ObjectWithValidIfOverClass_fields_firstName =
    const DeclarationMirror(name: 'firstName', type: String);
const $$ObjectWithValidIfOverClass_fields_lastName =
    const DeclarationMirror(name: 'lastName', type: String);

const ObjectWithValidIfOverClassClassMirror =
    const ClassMirror(name: 'ObjectWithValidIfOverClass', constructors: const {
  '': const FunctionMirror(
      name: '', $call: _ObjectWithValidIfOverClass__Constructor)
}, annotations: const [
  const ValidIf(_firstNameAndLastNameAreDifferent,
      description: _firstNameAndLastNameShouldBeDifferentMessage, iff: null)
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

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors(
      {ObjectWithValidIfOverClass: ObjectWithValidIfOverClassClassMirror});
}
