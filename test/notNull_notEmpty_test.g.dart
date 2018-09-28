// GENERATED CODE - DO NOT MODIFY BY HAND

part of notNull_notEmpty_test;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$ObjectWithNotNullSerializable extends SerializableMap {
  dynamic get aNotNull;
  void set aNotNull(dynamic v);

  operator [](Object __key) {
    switch (__key) {
      case 'aNotNull':
        return aNotNull;
    }
    throwFieldNotFoundException(__key, 'ObjectWithNotNull');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'aNotNull':
        aNotNull = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithNotNull');
  }

  Iterable<String> get keys => ObjectWithNotNullClassMirror.fields.keys;
}

abstract class _$ObjectWithNotNullIfSerializable extends SerializableMap {
  int get fieldA;
  int get fieldB;
  void set fieldA(int v);
  void set fieldB(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'fieldA':
        return fieldA;
      case 'fieldB':
        return fieldB;
    }
    throwFieldNotFoundException(__key, 'ObjectWithNotNullIf');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'fieldA':
        fieldA = __value;
        return;
      case 'fieldB':
        fieldB = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithNotNullIf');
  }

  Iterable<String> get keys => ObjectWithNotNullIfClassMirror.fields.keys;
}

abstract class _$ObjectWithNotEmptySerializable extends SerializableMap {
  String get str;
  void set str(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'str':
        return str;
    }
    throwFieldNotFoundException(__key, 'ObjectWithNotEmpty');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'str':
        str = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithNotEmpty');
  }

  Iterable<String> get keys => ObjectWithNotEmptyClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ObjectWithNotNull__Constructor([positionalParams, namedParams]) =>
    new ObjectWithNotNull();

const $$ObjectWithNotNull_fields_aNotNull = const DeclarationMirror(
    name: 'aNotNull', type: dynamic, annotations: const [notNull]);

const ObjectWithNotNullClassMirror = const ClassMirror(
    name: 'ObjectWithNotNull',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ObjectWithNotNull__Constructor)
    },
    fields: const {
      'aNotNull': $$ObjectWithNotNull_fields_aNotNull
    },
    getters: const [
      'aNotNull'
    ],
    setters: const [
      'aNotNull'
    ]);

_ObjectWithNotNullIf__Constructor([positionalParams, namedParams]) =>
    new ObjectWithNotNullIf();

const $$ObjectWithNotNullIf_fields_fieldA =
    const DeclarationMirror(name: 'fieldA', type: int);
const $$ObjectWithNotNullIf_fields_fieldB = const DeclarationMirror(
    name: 'fieldB',
    type: int,
    annotations: const [
      const NotNull(description: fieldBNotNullIfFieldAGt123, iff: _fieldAGt123)
    ]);

const ObjectWithNotNullIfClassMirror =
    const ClassMirror(name: 'ObjectWithNotNullIf', constructors: const {
  '': const FunctionMirror(name: '', $call: _ObjectWithNotNullIf__Constructor)
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

_ObjectWithNotEmpty__Constructor([positionalParams, namedParams]) =>
    new ObjectWithNotEmpty();

const $$ObjectWithNotEmpty_fields_str = const DeclarationMirror(
    name: 'str', type: String, annotations: const [notEmpty]);

const ObjectWithNotEmptyClassMirror =
    const ClassMirror(name: 'ObjectWithNotEmpty', constructors: const {
  '': const FunctionMirror(name: '', $call: _ObjectWithNotEmpty__Constructor)
}, fields: const {
  'str': $$ObjectWithNotEmpty_fields_str
}, getters: const [
  'str'
], setters: const [
  'str'
]);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithNotNull: ObjectWithNotNullClassMirror,
    ObjectWithNotNullIf: ObjectWithNotNullIfClassMirror,
    ObjectWithNotEmpty: ObjectWithNotEmptyClassMirror
  });
}
