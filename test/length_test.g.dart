// GENERATED CODE - DO NOT MODIFY BY HAND

part of length_test;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$ObjectWithLengthSerializable extends SerializableMap {
  String get myStringWithMin;
  String get myStringWithMax;
  String get myStringWithMinAndMax;
  void set myStringWithMin(String v);
  void set myStringWithMax(String v);
  void set myStringWithMinAndMax(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'myStringWithMin':
        return myStringWithMin;
      case 'myStringWithMax':
        return myStringWithMax;
      case 'myStringWithMinAndMax':
        return myStringWithMinAndMax;
    }
    throwFieldNotFoundException(__key, 'ObjectWithLength');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'myStringWithMin':
        myStringWithMin = __value;
        return;
      case 'myStringWithMax':
        myStringWithMax = __value;
        return;
      case 'myStringWithMinAndMax':
        myStringWithMinAndMax = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithLength');
  }

  Iterable<String> get keys => ObjectWithLengthClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ObjectWithLength__Constructor([positionalParams, namedParams]) =>
    new ObjectWithLength();

const $$ObjectWithLength_fields_myStringWithMin = const DeclarationMirror(
    name: 'myStringWithMin',
    type: String,
    annotations: const [
      const Length(min: 2, max: null, description: lengthShouldBeBetweenMessage)
    ]);
const $$ObjectWithLength_fields_myStringWithMax = const DeclarationMirror(
    name: 'myStringWithMax',
    type: String,
    annotations: const [
      const Length(min: null, max: 4, description: lengthShouldBeBetweenMessage)
    ]);
const $$ObjectWithLength_fields_myStringWithMinAndMax = const DeclarationMirror(
    name: 'myStringWithMinAndMax',
    type: String,
    annotations: const [
      const Length(min: 2, max: 4, description: lengthShouldBeBetweenMessage)
    ]);

const ObjectWithLengthClassMirror =
    const ClassMirror(name: 'ObjectWithLength', constructors: const {
  '': const FunctionMirror(name: '', $call: _ObjectWithLength__Constructor)
}, fields: const {
  'myStringWithMin': $$ObjectWithLength_fields_myStringWithMin,
  'myStringWithMax': $$ObjectWithLength_fields_myStringWithMax,
  'myStringWithMinAndMax': $$ObjectWithLength_fields_myStringWithMinAndMax
}, getters: const [
  'myStringWithMin',
  'myStringWithMax',
  'myStringWithMinAndMax'
], setters: const [
  'myStringWithMin',
  'myStringWithMax',
  'myStringWithMinAndMax'
]);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({ObjectWithLength: ObjectWithLengthClassMirror});
}
