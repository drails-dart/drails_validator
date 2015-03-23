library ValidIf_over_class;

import 'package:unittest/unittest.dart';
import 'package:drails_validator/drails_validator.dart';

_firstNameAndLastNameAreDifferent(ObjectWithValidIfOverClass o) => o.firstName != o.lastName;

@ValidIf(_firstNameAndLastNameAreDifferent)
class ObjectWithValidIfOverClass {
  String firstName;
  String lastName;
}

main() {
  var o = new ObjectWithValidIfOverClass();
  
  group('firstName and lastName equals', () {
    expect(validate(o).errors, {'': ['']});
    expect(validate(o..firstName = 'a'..lastName = 'a').errors, {'': ['']});
  });
}