// GENERATED CODE - DO NOT MODIFY BY HAND

part of length_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library length_test
// **************************************************************************

_initMirrors() {
  initClassMirrors({ObjectWithLength: ObjectWithLengthClassMirror});
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithLength
// **************************************************************************

abstract class _$ObjectWithLengthSerializable extends SerializableMap {
  String get myStringWithMin;
  String get myStringWithMax;
  String get myStringWithMinAndMax;
  void set myStringWithMin(String v);
  void set myStringWithMax(String v);
  void set myStringWithMinAndMax(String v);

  operator [](Object key) {
    switch (key) {
      case 'myStringWithMin':
        return myStringWithMin;
      case 'myStringWithMax':
        return myStringWithMax;
      case 'myStringWithMinAndMax':
        return myStringWithMinAndMax;
    }
    throwFieldNotFoundException(key, 'ObjectWithLength');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'myStringWithMin':
        myStringWithMin = value;
        return;
      case 'myStringWithMax':
        myStringWithMax = value;
        return;
      case 'myStringWithMinAndMax':
        myStringWithMinAndMax = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithLength');
  }

  Iterable<String> get keys => ObjectWithLengthClassMirror.fields.keys;
}

_ObjectWithLength__Constructor(params) => new ObjectWithLength();

const $$ObjectWithLength_fields_myStringWithMin = const DeclarationMirror(
    type: String,
    annotations: const [const Length(min: 2, max: null, description: null)]);
const $$ObjectWithLength_fields_myStringWithMax = const DeclarationMirror(
    type: String,
    annotations: const [const Length(min: null, max: 4, description: null)]);
const $$ObjectWithLength_fields_myStringWithMinAndMax = const DeclarationMirror(
    type: String,
    annotations: const [const Length(min: 2, max: 4, description: null)]);

const ObjectWithLengthClassMirror =
    const ClassMirror(name: 'ObjectWithLength', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithLength__Constructor)
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
