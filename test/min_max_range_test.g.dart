// GENERATED CODE - DO NOT MODIFY BY HAND

part of min_max_range_test;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$ObjectWithMinSerializable extends SerializableMap {
  int get myInt;
  void set myInt(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'myInt':
        return myInt;
    }
    throwFieldNotFoundException(__key, 'ObjectWithMin');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'myInt':
        myInt = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithMin');
  }

  Iterable<String> get keys => ObjectWithMinClassMirror.fields.keys;
}

abstract class _$ObjectWithMaxSerializable extends SerializableMap {
  int get myInt;
  void set myInt(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'myInt':
        return myInt;
    }
    throwFieldNotFoundException(__key, 'ObjectWithMax');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'myInt':
        myInt = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithMax');
  }

  Iterable<String> get keys => ObjectWithMaxClassMirror.fields.keys;
}

abstract class _$ObjectWithRangeSerializable extends SerializableMap {
  int get myInt;
  void set myInt(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'myInt':
        return myInt;
    }
    throwFieldNotFoundException(__key, 'ObjectWithRange');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'myInt':
        myInt = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithRange');
  }

  Iterable<String> get keys => ObjectWithRangeClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_ObjectWithMin__Constructor([positionalParams, namedParams]) =>
    new ObjectWithMin();

const $$ObjectWithMin_fields_myInt =
    const DeclarationMirror(name: 'myInt', type: int, annotations: const [
  const Min(10,
      description: valueShouldBeGreaterThanMessage, isMinInclusive: true)
]);

const ObjectWithMinClassMirror = const ClassMirror(
    name: 'ObjectWithMin',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ObjectWithMin__Constructor)
    },
    fields: const {
      'myInt': $$ObjectWithMin_fields_myInt
    },
    getters: const [
      'myInt'
    ],
    setters: const [
      'myInt'
    ]);

_ObjectWithMax__Constructor([positionalParams, namedParams]) =>
    new ObjectWithMax();

const $$ObjectWithMax_fields_myInt =
    const DeclarationMirror(name: 'myInt', type: int, annotations: const [
  const Max(10, description: valueShouldBeLessThanMessage, isMaxInclusive: true)
]);

const ObjectWithMaxClassMirror = const ClassMirror(
    name: 'ObjectWithMax',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ObjectWithMax__Constructor)
    },
    fields: const {
      'myInt': $$ObjectWithMax_fields_myInt
    },
    getters: const [
      'myInt'
    ],
    setters: const [
      'myInt'
    ]);

_ObjectWithRange__Constructor([positionalParams, namedParams]) =>
    new ObjectWithRange();

const $$ObjectWithRange_fields_myInt =
    const DeclarationMirror(name: 'myInt', type: int, annotations: const [
  const Range(1, 10,
      description: valueShouldBeBetweenMessage,
      isMaxInclusive: true,
      isMinInclusive: true)
]);

const ObjectWithRangeClassMirror = const ClassMirror(
    name: 'ObjectWithRange',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _ObjectWithRange__Constructor)
    },
    fields: const {
      'myInt': $$ObjectWithRange_fields_myInt
    },
    getters: const [
      'myInt'
    ],
    setters: const [
      'myInt'
    ]);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({
    ObjectWithMin: ObjectWithMinClassMirror,
    ObjectWithMax: ObjectWithMaxClassMirror,
    ObjectWithRange: ObjectWithRangeClassMirror
  });
}
