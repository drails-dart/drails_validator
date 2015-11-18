import 'package:test/test.dart';
import 'package:drails_validator/drails_validator.dart';

@validable
class MatchesSsn {

  @Matches(r'\d\d\d-\d\d-\d\d\d\d')
  String ssn;
}

main() {
  group('test Matches ->', () {
    var o = new MatchesSsn(),
        expected = {
          'ssn': [r'value should match \d\d\d-\d\d-\d\d\d\d']
        };

    test('test empty ssn', () {
      expect(validate(o).errors, expected);
    });

    test('test wrong ssn', () {
      expect(validate(o..ssn = '11').errors, expected);
    });

    test('test correct ssn', () {
      expect(validate(o..ssn = '123-45-6789').errors, isEmpty);
    });
  });

}