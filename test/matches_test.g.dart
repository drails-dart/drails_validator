// GENERATED CODE - DO NOT MODIFY BY HAND

part of matches_test;

// **************************************************************************
// Generator: InitMirrorsGenerator
// Target: library matches_test
// **************************************************************************

_initMirrors() {
  initClassMirrors({MatchesSsn: MatchesSsnClassMirror});
  initFunctionMirrors({});
}

// **************************************************************************
// Generator: DsonGenerator
// Target: class MatchesSsn
// **************************************************************************

abstract class _$MatchesSsnSerializable extends SerializableMap {
  String get ssn;
  void set ssn(String v);

  operator [](Object key) {
    switch (key) {
      case 'ssn':
        return ssn;
    }
    throwFieldNotFoundException(key, 'MatchesSsn');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'ssn':
        ssn = value;
        return;
    }
    throwFieldNotFoundException(key, 'MatchesSsn');
  }

  get keys => MatchesSsnClassMirror.fields.keys;
}

_MatchesSsn__Constructor(params) => new MatchesSsn();

const $$MatchesSsn_fields_ssn = const DeclarationMirror(
    type: String,
    annotations: const [
      const Matches(r'\d\d\d-\d\d-\d\d\d\d', customDescription: null)
    ]);

const MatchesSsnClassMirror =
    const ClassMirror(name: 'MatchesSsn', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _MatchesSsn__Constructor)
}, fields: const {
  'ssn': $$MatchesSsn_fields_ssn
}, getters: const [
  'ssn'
], setters: const [
  'ssn'
]);
