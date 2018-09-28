// GENERATED CODE - DO NOT MODIFY BY HAND

part of matches_test;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$MatchesSsnSerializable extends SerializableMap {
  String get ssn;
  void set ssn(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'ssn':
        return ssn;
    }
    throwFieldNotFoundException(__key, 'MatchesSsn');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'ssn':
        ssn = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'MatchesSsn');
  }

  Iterable<String> get keys => MatchesSsnClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_MatchesSsn__Constructor([positionalParams, namedParams]) => new MatchesSsn();

const $$MatchesSsn_fields_ssn =
    const DeclarationMirror(name: 'ssn', type: String, annotations: const [
  const Matches(r'\d\d\d-\d\d-\d\d\d\d', description: valueShouldMatchMessage)
]);

const MatchesSsnClassMirror = const ClassMirror(
    name: 'MatchesSsn',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _MatchesSsn__Constructor)
    },
    fields: const {
      'ssn': $$MatchesSsn_fields_ssn
    },
    getters: const [
      'ssn'
    ],
    setters: const [
      'ssn'
    ]);

// **************************************************************************
// InitMirrorsGenerator
// **************************************************************************

_initMirrors() {
  initClassMirrors({MatchesSsn: MatchesSsnClassMirror});
}
