library ValidIf_over_class;

import 'package:drails_validator/drails_validator.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

part 'ValidIf_over_class_test.g.dart';

_firstNameAndLastNameAreDifferent(ObjectWithValidIfOverClass o) => o.firstName != o.lastName;

_firstNameAndLastNameShouldBeDifferentMessage() =>
    Intl.message('First name and last name should be different', name: '_firstNameAndLastNameShouldBeDifferentMessage');

@serializable
@ValidIf(_firstNameAndLastNameAreDifferent, description: _firstNameAndLastNameShouldBeDifferentMessage)
class ObjectWithValidIfOverClass extends _$ObjectWithValidIfOverClassSerializable {
  String firstName;
  String lastName;
}

main() {
  _initMirrors();

  var o = new ObjectWithValidIfOverClass();

  test('firstName and lastName equals', () {
    expect(validate(o).errors, {
      '': [_firstNameAndLastNameShouldBeDifferentMessage()]
    });
    expect(
        validate(o
              ..firstName = 'a'
              ..lastName = 'b')
            .errors,
        {});
  });
}
