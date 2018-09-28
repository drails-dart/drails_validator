part of drails_validator;

/// Type of function that should be implemented for validation
typedef bool IsValidFunction(porpertyVal);

/// Type of function that should be implemented for validation
typedef bool IsValidFunction2(porpertyVal, ValidIf annotation);

/// Type of function that should be implemented to check an if condition for the entity
typedef bool IffFunction(entity);

/// Checks if the object or attribute accomplish the isValid function, for example:
///
///     _equalsTo5(int attr) => attr == 5;
///
///     class ObjectWithValidIf {
///       @ValidIf(_equalsTo5, description: 'Value should be equals to 5')
///       int equalsTo5;
///     }
///
///     main() {
///       var o = new ObjectWithValidIf();
///
///       print(validate(o).errors); //will print "{'equalsTo5': ['Value should be equals to 5']}"
///
///       print(validate(o..equalsTo5 = 5).isValid); //will print true
///     }
class ValidIf extends Annotation {
  const ValidIf(this.isValid, {this.description = valueIsInvalidMessage, this.iff});

  final Function description;

  /// type: [IsValidFunction]
  final Function /*IsValidFunction*/ isValid;

  /// type: [IsValidFunction2]
  final Function /*IsValidFunction*/ isValid2 = null;

  /// If the [iff] function is not null, it is checked before checking the validity of the field, for example:
  ///
  ///     _equalsTo5(int attr) => attr == 5;
  ///
  ///     _fooGt10(ObjectWithValidIf o) => o.val != null && o.val > 10;
  ///
  ///     class ObjectWithValidIf {
  ///       int foo;
  ///
  ///       @ValidIf(_equalsTo5, iff: _fooGt10, description: 'Value should be equals to 5 if foo is greater than 10')
  ///       int equalsTo5;
  ///     }
  ///
  ///     main() {
  ///       var o = new ObjectWithValidIf();
  ///
  ///       print(validate(o).isValid); //will print "true"
  ///
  ///       print(validate(o..foo = 1).isValid); //will print true
  ///
  ///       print(validate(o..foo = 11).errors); //will print "{'equalsTo5': ['Value should be equals to 5 if foo is greater than 10']}"
  ///
  ///       print(validate(o..equalsTo5 = 5).isValid); //will print true
  ///     }
  ///
  /// type: [IffFunction]
  final Function /*IffFunction*/ iff;
}

/// checks if the value is not null
bool isNotNull(val) => val != null;

/// Shorthand for [NotNull]
const notNull = const NotNull();

/// annotation to check if the attribute is not null
class NotNull implements ValidIf {
  const NotNull({this.description: valueShouldNotBeNullMessage, this.iff});

  /// custom description to display if the attribute is null
  final Function description;

  @override
  IsValidFunction get isValid => isNotNull;

  /// type: [IsValidFunction2]
  Function /*IsValidFunction2*/ get isValid2 => null;

  /// If the [iff] function is not null, it is checked before checking the validity of the field, for example:
  ///
  ///     _fooGt10(ObjectWithValidIf o) => o.val != null && o.val > 10;
  ///
  ///     class ObjectWithValidIf {
  ///       int foo;
  ///
  ///       @NotNull(iff: _fooGt10, description: 'Value should not be null if foo is greater than 10')
  ///       int notNullVal;
  ///     }
  ///
  ///     main() {
  ///       var o = new ObjectWithValidIf();
  ///
  ///       print(validate(o).isValid); //will print "true"
  ///
  ///       print(validate(o..foo = 1).isValid); //will print true
  ///
  ///       print(validate(o..foo = 11).errors); //will print "{'equalsTo5': ['Value should not be null if foo is greater than 10']}"
  ///
  ///       print(validate(o..notNullVal = 5).isValid); //will print true
  ///     }
  ///
  /// type: [IffFunction]
  final Function /*IfFunction*/ iff;
}

/// Checks if the [value] is not empty (null is treated as empty)
bool isNotEmpty(value) => isNotNull(value) && value.isNotEmpty;

/// Shorthand for [NotEmpty]
const notEmpty = const NotEmpty();

/// Annotation to check if the value is not Empty (null is treated as empty)
class NotEmpty extends NotNull {
  final Function description;
  IsValidFunction get isValid => isNotEmpty;

  const NotEmpty({this.description = valueShouldNotBeEmptyMessage});
}

/// chekcs if the [value] is greater than
bool isGreaterThanMin(Comparable value, Min me) {
  if (value == null) return false;
  var comparison = value.compareTo(me.minVal);
  return (me.isMinInclusive && comparison >= 0 || !me.isMinInclusive && comparison > 0);
}

class Min extends NotNull {
  const Min(this.minVal, {this.description = valueShouldBeGreaterThanMessage, this.isMinInclusive: true});

  final Function description;
  final Comparable minVal;
  final bool isMinInclusive;

  /// type: [IsValidFunction2]
  Function /*IsValidFunction2*/ get isValid2 => isGreaterThanMin;
}

bool isLowerThanMax(Comparable val, Max annotation) {
  if (val == null) return false;
  var comparison = val.compareTo(annotation.maxVal);
  return (annotation.isMaxInclusive && comparison <= 0 || !annotation.isMaxInclusive && comparison < 0);
}

/// Specify that the attribute value should be lower than [maxVal] or lower or equal that [maxVal] if [isMaxInclusive] is true
class Max extends NotNull {
  const Max(this.maxVal, {this.description = valueShouldBeLessThanMessage, this.isMaxInclusive: true});

  final Function description;
  final Comparable maxVal;
  final bool isMaxInclusive;

  /// type: [IsValidFunction2]
  Function /*IsValidFunction2*/ get isValid2 => isLowerThanMax;
}

/// checks if [value] is in range
bool isInRange(Comparable value, Range annotation) =>
    isGreaterThanMin(value, annotation) && isLowerThanMax(value, annotation);

/// Specify that the attribute value should be between [minVal] and [maxVal]
class Range extends NotNull implements Min, Max {
  const Range(this.minVal, this.maxVal, {this.description = valueShouldBeBetweenMessage, this.isMaxInclusive: true, this.isMinInclusive: true});

  final Function description;
  final Comparable minVal;
  final Comparable maxVal;
  final bool isMinInclusive;
  final bool isMaxInclusive;

  /// type: [IsValidFunction2]
  Function /*IsValidFunction2*/ get isValid2 => isInRange;
}

/// checks if the [val] has length between min and max
hasLength(String val, Length annotation) =>
    isNotNull(val) &&
    (annotation.min != null ? val.length >= annotation.min : true) &&
    (annotation.max != null ? val.length <= annotation.max : true);

/// Annotation to check if the attribute has lenght between [min] and [max]
class Length extends NotNull {
  const Length({this.min, this.max, this.description = lengthShouldBeBetweenMessage});

  final Function description;
  final int max;
  final int min;

  /// type: [IsValidFunction2]
  Function /*IsValidFunction2*/ get isValid2 => hasLength;
}

/// checks if the [val] matches the regular expression passed to [annotation]
matches(String val, Matches annotation) => isNotNull(val) && validator.matches(val, annotation.regExp);

/// Annotation to check if the attribute matches the specified regular expression [regExp]
class Matches extends NotNull {
  const Matches(this.regExp, {this.description = valueShouldMatchMessage});

  final Function description;
  final String regExp;

  /// type: [IsValidFunction2]
  Function /*IsValidFunction2*/ get isValid2 => matches;
}
