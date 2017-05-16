library ValidIf_over_class;

import 'package:test/test.dart';
import 'package:drails_validator/drails_validator.dart';

part 'ValidIf_over_class_test.g.dart';

_firstNameAndLastNameAreDifferent(ObjectWithValidIfOverClass o) => o.firstName != o.lastName;

@serializable
@ValidIf(_firstNameAndLastNameAreDifferent)
class ObjectWithValidIfOverClass extends _$ObjectWithValidIfOverClassSerializable {
  String firstName;
  String lastName;
}

main() {
  _initMirrors();

  var o = new ObjectWithValidIfOverClass();
  
  test('firstName and lastName equals', () {
    expect(validate(o).errors, {'': ['']});
    expect(validate(o..firstName = 'a'..lastName = 'a').errors, {'': ['']});
  });
}