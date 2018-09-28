// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'es';

  static m0(min, max) => "La longitud debe estar entre ${min} y ${max}";

  static m1(min) => "La longitud debe ser mayor que ${min}";

  static m2(max) => "La longitud debe ser menor que ${max}";

  static m3(minVal, maxVal) => "El valor debe estar entre ${minVal} y ${maxVal}";

  static m4(minVal) => "El valor debe ser mayor que ${minVal}";

  static m5(maxVal) => "El valor debe ser menor que ${maxVal}";

  static m6(regExp) => "el valor debe coincidir con ${regExp}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "_lengthShouldBeBetweenMessage" : m0,
    "_lengthShouldBeGreaterThanMessage" : m1,
    "_lengthShouldBeLessThanMessage" : m2,
    "_valueShouldBeBetweenMessage" : m3,
    "_valueShouldBeGreaterThanMessage" : m4,
    "_valueShouldBeLessThanMessage" : m5,
    "_valueShouldMatchMessage" : m6,
    "enteredEmailInvalidMessage" : MessageLookupByLibrary.simpleMessage("El correo electrónico introducido no es válido"),
    "enteredSSNInvalidMessage" : MessageLookupByLibrary.simpleMessage("El SSN ingresado no es válido"),
    "fieldBShouldNotBeNullIfFieldAGt123Message" : MessageLookupByLibrary.simpleMessage("fieldB no debe ser nulo si fieldA es mayor que 123"),
    "valueAfterNowAreNotAllowedMessage" : MessageLookupByLibrary.simpleMessage("Los valores después de ahora no están permitidos."),
    "valueIsInvalidMessage" : MessageLookupByLibrary.simpleMessage("El valor es inválido"),
    "valueShouldNotBeEmptyMessage" : MessageLookupByLibrary.simpleMessage("El valor no debe estar vacío"),
    "valueShouldNotBeNullMessage" : MessageLookupByLibrary.simpleMessage("El valor no debe ser nulo")
  };
}
