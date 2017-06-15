// GENERATED CODE - DO NOT MODIFY BY HAND

part of notNull_notEmpty_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library notNull_notEmpty_test
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithNotNull: ObjectWithNotNullClassMirror,
    ObjectWithNotNullIf: ObjectWithNotNullIfClassMirror,
    ObjectWithNotEmpty: ObjectWithNotEmptyClassMirror
  });
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithNotNull
// **************************************************************************

abstract class _$ObjectWithNotNullSerializable extends SerializableMap {
  dynamic get aNotNull;
  void set aNotNull(dynamic v);

  operator [](Object key) {
    switch (key) {
      case 'aNotNull':
        return aNotNull;
    }
    throwFieldNotFoundException(key, 'ObjectWithNotNull');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'aNotNull':
        aNotNull = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithNotNull');
  }

  Iterable<String> get keys => ObjectWithNotNullClassMirror.fields.keys;
}

_ObjectWithNotNull__Constructor(params) => new ObjectWithNotNull();

const $$ObjectWithNotNull_fields_aNotNull =
    const DeclarationMirror(type: dynamic, annotations: const [notNull]);

const ObjectWithNotNullClassMirror =
    const ClassMirror(name: 'ObjectWithNotNull', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithNotNull__Constructor)
}, fields: const {
  'aNotNull': $$ObjectWithNotNull_fields_aNotNull
}, getters: const [
  'aNotNull'
], setters: const [
  'aNotNull'
]);

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithNotNullIf
// **************************************************************************

abstract class _$ObjectWithNotNullIfSerializable extends SerializableMap {
  int get fieldA;
  int get fieldB;
  void set fieldA(int v);
  void set fieldB(int v);

  operator [](Object key) {
    switch (key) {
      case 'fieldA':
        return fieldA;
      case 'fieldB':
        return fieldB;
    }
    throwFieldNotFoundException(key, 'ObjectWithNotNullIf');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'fieldA':
        fieldA = value;
        return;
      case 'fieldB':
        fieldB = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithNotNullIf');
  }

  Iterable<String> get keys => ObjectWithNotNullIfClassMirror.fields.keys;
}

_ObjectWithNotNullIf__Constructor(params) => new ObjectWithNotNullIf();

const $$ObjectWithNotNullIf_fields_fieldA = const DeclarationMirror(type: int);
const $$ObjectWithNotNullIf_fields_fieldB =
    const DeclarationMirror(type: int, annotations: const [
  const NotNull(
      description: r'fieldB should not be null if fieldA is greater than 123',
      iff: _fieldAGt123)
]);

const ObjectWithNotNullIfClassMirror =
    const ClassMirror(name: 'ObjectWithNotNullIf', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithNotNullIf__Constructor)
}, fields: const {
  'fieldA': $$ObjectWithNotNullIf_fields_fieldA,
  'fieldB': $$ObjectWithNotNullIf_fields_fieldB
}, getters: const [
  'fieldA',
  'fieldB'
], setters: const [
  'fieldA',
  'fieldB'
]);

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithNotEmpty
// **************************************************************************

abstract class _$ObjectWithNotEmptySerializable extends SerializableMap {
  String get str;
  void set str(String v);

  operator [](Object key) {
    switch (key) {
      case 'str':
        return str;
    }
    throwFieldNotFoundException(key, 'ObjectWithNotEmpty');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'str':
        str = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithNotEmpty');
  }

  Iterable<String> get keys => ObjectWithNotEmptyClassMirror.fields.keys;
}

_ObjectWithNotEmpty__Constructor(params) => new ObjectWithNotEmpty();

const $$ObjectWithNotEmpty_fields_str =
    const DeclarationMirror(type: String, annotations: const [notEmpty]);

const ObjectWithNotEmptyClassMirror =
    const ClassMirror(name: 'ObjectWithNotEmpty', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithNotEmpty__Constructor)
}, fields: const {
  'str': $$ObjectWithNotEmpty_fields_str
}, getters: const [
  'str'
], setters: const [
  'str'
]);
