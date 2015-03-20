// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.example;


import 'package:drails_validator/drails_validator.dart';

class Person {
  @notEmpty
  String name;
  
  @Range(18, 120)
  int age;
}

main() {
  var p = new Person()
    ..name = ''
    ..age = 130;
  
  print(validate(p).errors);
}
