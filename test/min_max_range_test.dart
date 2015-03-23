library min_max_range_test;

import 'package:unittest/unittest.dart';
import 'package:drails_validator/drails_validator.dart';

class ObjectWithMin {
  @Min(10)
  int myInt;
}


class ObjectWithMax {
  @Max(10)
  int myInt;
}


class ObjectWithRange {
  @Range(1,10)
  int myInt;
}

main() {
  group('Min ->', () {
    var o = new ObjectWithMin();
    var expected = {
      'myInt': ['Value should be greater than 10']
    };

    test('null', () {
      expect(validate(o).errors, equals(expected));
    });

    test('less than min', () {
      expect(validate(o..myInt = 1).errors, equals(expected));
    });

    test('equals to min', () {
      expect(validate(o..myInt = 10).errors, isEmpty);
    });

    test('grater than min', () {
      expect(validate(o..myInt = 11).errors, isEmpty);
    });
  });
  
  group('Max ->', () {
    var oMax = new ObjectWithMax();
    var expected = {
      'myInt': ['Value should be less than 10']
    };

    test('null', () {
      expect(validate(oMax).errors, equals(expected));
    });

    test('greater than max', () {
      expect(validate(oMax..myInt = 11).errors, equals(expected));
    });

    test('equals to max', () {
      expect(validate(oMax..myInt = 10).errors, isEmpty);
    });

    test('grater than max', () {
      expect(validate(oMax..myInt = 1).errors, isEmpty);
    });
  });

  group('Range ->', () {
    var o = new ObjectWithRange();
    var expected = {
      'myInt': ['Value should be between 1 and 10']
    };

    test('null', () {
      expect(validate(o).errors, equals(expected));
    });

    test('greater than max', () {
      expect(validate(o..myInt = 11).errors, equals(expected));
    });

    test('equals to max', () {
      expect(validate(o..myInt = 10).errors, isEmpty);
    });

    test('equals to min', () {
      expect(validate(o..myInt = 1).errors, isEmpty);
    });
    
    test('less than min', () {
      expect(validate(o..myInt = 0).errors, equals(expected));
    });
  });
}