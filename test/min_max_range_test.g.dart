// GENERATED CODE - DO NOT MODIFY BY HAND

part of min_max_range_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library min_max_range_test
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithMin: ObjectWithMinClassMirror,
    ObjectWithMax: ObjectWithMaxClassMirror,
    ObjectWithRange: ObjectWithRangeClassMirror
  });
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithMin
// **************************************************************************

abstract class _$ObjectWithMinSerializable extends SerializableMap {
  int get myInt;
  void set myInt(int v);

  operator [](Object key) {
    switch (key) {
      case 'myInt':
        return myInt;
    }
    throwFieldNotFoundException(key, 'ObjectWithMin');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'myInt':
        myInt = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithMin');
  }

  Iterable<String> get keys => ObjectWithMinClassMirror.fields.keys;
}

_ObjectWithMin__Constructor(params) => new ObjectWithMin();

const $$ObjectWithMin_fields_myInt = const DeclarationMirror(
    type: int,
    annotations: const [
      const Min(10, description: null, isMinInclusive: true)
    ]);

const ObjectWithMinClassMirror =
    const ClassMirror(name: 'ObjectWithMin', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithMin__Constructor)
}, fields: const {
  'myInt': $$ObjectWithMin_fields_myInt
}, getters: const [
  'myInt'
], setters: const [
  'myInt'
]);

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithMax
// **************************************************************************

abstract class _$ObjectWithMaxSerializable extends SerializableMap {
  int get myInt;
  void set myInt(int v);

  operator [](Object key) {
    switch (key) {
      case 'myInt':
        return myInt;
    }
    throwFieldNotFoundException(key, 'ObjectWithMax');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'myInt':
        myInt = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithMax');
  }

  Iterable<String> get keys => ObjectWithMaxClassMirror.fields.keys;
}

_ObjectWithMax__Constructor(params) => new ObjectWithMax();

const $$ObjectWithMax_fields_myInt = const DeclarationMirror(
    type: int,
    annotations: const [
      const Max(10, description: null, isMaxInclusive: true)
    ]);

const ObjectWithMaxClassMirror =
    const ClassMirror(name: 'ObjectWithMax', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithMax__Constructor)
}, fields: const {
  'myInt': $$ObjectWithMax_fields_myInt
}, getters: const [
  'myInt'
], setters: const [
  'myInt'
]);

// **************************************************************************
// Generator: DsonGenerator
// Target: class ObjectWithRange
// **************************************************************************

abstract class _$ObjectWithRangeSerializable extends SerializableMap {
  int get myInt;
  void set myInt(int v);

  operator [](Object key) {
    switch (key) {
      case 'myInt':
        return myInt;
    }
    throwFieldNotFoundException(key, 'ObjectWithRange');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'myInt':
        myInt = value;
        return;
    }
    throwFieldNotFoundException(key, 'ObjectWithRange');
  }

  Iterable<String> get keys => ObjectWithRangeClassMirror.fields.keys;
}

_ObjectWithRange__Constructor(params) => new ObjectWithRange();

const $$ObjectWithRange_fields_myInt =
    const DeclarationMirror(type: int, annotations: const [
  const Range(1, 10,
      description: null, isMaxInclusive: true, isMinInclusive: true)
]);

const ObjectWithRangeClassMirror =
    const ClassMirror(name: 'ObjectWithRange', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _ObjectWithRange__Constructor)
}, fields: const {
  'myInt': $$ObjectWithRange_fields_myInt
}, getters: const [
  'myInt'
], setters: const [
  'myInt'
]);
