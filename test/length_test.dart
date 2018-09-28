library length_test;

import 'package:test/test.dart';
import 'package:drails_validator/drails_validator.dart';

part 'length_test.g.dart';

@serializable
class ObjectWithLength extends _$ObjectWithLengthSerializable {
  @Length(min: 2)
  String myStringWithMin;

  @Length(max: 4)
  String myStringWithMax;

  @Length(min: 2, max: 4)
  String myStringWithMinAndMax;
}

main() {
  _initMirrors();

  group('Length ->', () {
    var o = new ObjectWithLength(),
        expected = {
      'myStringWithMin': ['Length should be greater than 2'],
      'myStringWithMax': ['Length should be less than 4'],
      'myStringWithMinAndMax': ['Length should be between 2 and 4']
    };

    print(o);

    test('null', () {
      expect(validate(o).errors, expected);
    });

    test('empty', () {
      expect(
          validate(o
                ..myStringWithMin = ''
                ..myStringWithMinAndMax = '')
              .errors,
          expected);
    });

    test('lower than min, greater than max, not between min and max', () {
      expect(
          validate(o
                ..myStringWithMin = '1'
                ..myStringWithMax = '12345'
                ..myStringWithMinAndMax = '1')
              .errors,
          expected);
      expect(validate(o..myStringWithMinAndMax = '12345').errors, expected);
    });

    test('all correct', () {
      expect(
          validate(o
                ..myStringWithMin = '12'
                ..myStringWithMax = '1234'
                ..myStringWithMinAndMax = '12')
              .errors,
          isEmpty);
      expect(validate(o..myStringWithMax = '').errors, isEmpty);
    });
  });
}
