// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.test;

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

class ObjectWithLength {
  @Length(min: 2)
  String myStringWithMin;

  @Length(max: 4)
  String myStringWithMax;
  
  @Length(min: 2, max: 4)
  String myStringWithMinAndMax;
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
    var o = new ObjectWithMax();
    var expected = {
      'myInt': ['Value should be less than 10']
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

    test('grater than max', () {
      expect(validate(o..myInt = 1).errors, isEmpty);
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
  
  group('Length ->', () {
    var o = new ObjectWithLength(),
        expected = {
          'myStringWithMin': ['Length should be greather than 2'],
          'myStringWithMax': ['Length should be Lower than 4'],
          'myStringWithMinAndMax': ['Length should be between 2 and 4']
        };
    
    print(o);
    
    test('null', () {
      expect(validate(o).errors, expected);
    });
    
    test('empty', () {
      expect(validate(o..myStringWithMin = ''..myStringWithMax = ''..myStringWithMinAndMax = '').errors, expected);
    });
    
    test('lower than min, greater than max, not between min and max', () {
      expect(validate(o..myStringWithMin = '1'..myStringWithMax = '12345'..myStringWithMinAndMax = '1').errors, expected);
      expect(validate(o..myStringWithMin = '1'..myStringWithMax = '12345'..myStringWithMinAndMax = '12345').errors, expected);
    });
  });
  
}
