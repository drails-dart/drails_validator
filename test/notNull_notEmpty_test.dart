library notNull_notEmpty_test;

import 'package:drails_validator/drails_validator.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

part 'notNull_notEmpty_test.g.dart';

@serializable
class ObjectWithNotNull extends _$ObjectWithNotNullSerializable {
  @notNull
  var aNotNull;
}

_fieldAGt123(ObjectWithNotNullIf ownni) => ownni.fieldA != null && ownni.fieldA > 123;

String fieldBNotNullIfFieldAGt123() =>
    Intl.message("fieldB should not be null if fieldA is greater than 123", name: 'fieldBNotNullIfFieldAGt123');

@serializable
class ObjectWithNotNullIf extends _$ObjectWithNotNullIfSerializable {
  int fieldA;

  @NotNull(iff: _fieldAGt123, description: fieldBNotNullIfFieldAGt123)
  int fieldB;
}

@serializable
class ObjectWithNotEmpty extends _$ObjectWithNotEmptySerializable {
  @notEmpty
  String str;
}

main() {
  _initMirrors();

  group('NotNull ->', () {
    var o = new ObjectWithNotNull();
    var expected = {
      'aNotNull': ['Value should not be null']
    };

    test('null', () {
      expect(validate(o).errors, expected);
    });

    test('empty', () {
      expect(validate(o..aNotNull = '').errors, isEmpty);
    });

    test('not empy', () {
      expect(validate(o..aNotNull = 'x').errors, isEmpty);
    });
  });

  group('NotNullIf ->', () {
    var o = new ObjectWithNotNullIf();
    var expected = {
      'fieldB': ['fieldB should not be null if fieldA is greater than 123']
    };

    test('fieldA = null, fieldB = null', () {
      expect(validate(o).errors, isEmpty);
    });

    test('fieldA = 11, fieldB = null', () {
      expect(validate(o..fieldA = 11).errors, isEmpty);
    });

    test('fieldA = 124, fieldB = null', () {
      expect(validate(o..fieldA = 124).errors, expected);
    });

    test('fieldA = 124, fieldB = 1', () {
      expect(
          validate(o
                ..fieldA = 124
                ..fieldB = 1)
              .errors,
          isEmpty);
    });
  });

  group('NotEmpty ->', () {
    var o = new ObjectWithNotEmpty();
    var expected = {
      'str': ['Value should not be empty']
    };

    test('null', () {
      expect(validate(o).errors, expected);
    });

    test('empty', () {
      expect(validate(o..str = '').errors, expected);
    });

    test('not empy', () {
      expect(validate(o..str = 'x').errors, isEmpty);
    });
  });
}
