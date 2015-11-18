library ValidIf_over_class;

import 'package:test/test.dart';
import 'package:drails_validator/drails_validator.dart';

_firstNameAndLastNameAreDifferent(ObjectWithValidIfOverClass o) => o.firstName != o.lastName;

@validable
@ValidIf(_firstNameAndLastNameAreDifferent)
class ObjectWithValidIfOverClass {
  String firstName;
  String lastName;
}

main() {
  var o = new ObjectWithValidIfOverClass();
  
  test('firstName and lastName equals', () {
    expect(validate(o).errors, {'': ['']});
    expect(validate(o..firstName = 'a'..lastName = 'a').errors, {'': ['']});
  });
}