// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Validator.test;

import 'notNull_notEmpty_test.dart' as notNull_notEmpty_test;
import 'min_max_range_test.dart' as min_max_range_test;
import 'length_test.dart' as length_test;
import 'ValidIf_over_class_test.dart' as ValidIf_over_class_test;

main() {
  notNull_notEmpty_test.main();
  min_max_range_test.main();
  length_test.main();
  ValidIf_over_class_test.main();
}
