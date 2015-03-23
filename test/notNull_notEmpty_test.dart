library notNull_notEmpty_test;

import 'package:unittest/unittest.dart';
import 'package:drails_validator/drails_validator.dart';

class ObjectWithNotNull {
  @notNull
  var aNotNull;
}

class ObjectWithNotEmpty {
  @notEmpty
  String str;
}

main() {
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