part of drails_validator;

/// Type of function that should be implemented for validation
typedef bool IsValidFunction(porpertyVal);

/// Type of function that should be implemented for validation
typedef bool IsValidFunction2(porpertyVal, ValidIf annotation);

/// Type of function that should be implemented to check an if condition for the entity
typedef bool IfFunction(entity);

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
  const ValidIf(this.isValid, {this.description, this.iff});

  final String description;
  String get defaultDescription => description != null ? description : "";
  final IsValidFunction isValid;
  final IsValidFunction2 isValid2 = null;

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
  final IfFunction iff;
}

/// checks if the value is not null
bool isNotNull(val) => val != null;

/// Shorthand for [NotNull]
const notNull = const NotNull();

/// annotation to check if the attribute is not null
class NotNull implements ValidIf {
  const NotNull({this.description, this.iff});

  /// custom description to display if the attribute is null
  final String description;

  @override
  String get defaultDescription => description != null ? description : "Value should not be null";

  @override
  IsValidFunction get isValid => isNotNull;
  IsValidFunction2 get isValid2 => null;


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
  final Function iff;
}

/// Checks if the [value] is not empty (null is treated as empty)
bool isNotEmpty(value) => isNotNull(value) && value.isNotEmpty;

/// Shorthand for [NotEmpty]
const notEmpty = const NotEmpty();

/// Annotation to check if the value is not Empty (null is treated as empty)
class NotEmpty extends NotNull {
  final String description;
  String get defaultDescription => "Value should not be empty";
  IsValidFunction get isValid => isNotEmpty;

  const NotEmpty({this.description});
}

/// chekcs if the [value] is greater than
bool isGreaterThanMin(Comparable value, Min me) {
  if(value == null) return false;
  var comparison = value.compareTo(me.minVal);
  return (me.isMinInclusive && comparison >= 0 || !me.isMinInclusive && comparison > 0);
}

class Min extends NotNull {
  const Min(this.minVal, {this.description, this.isMinInclusive: true});

  final String description;
  final Comparable minVal;
  final bool isMinInclusive;

  String get defaultDescription => description != null ? description : "Value should be greater than $minVal";

  IsValidFunction2 get isValid2 => isGreaterThanMin;
}

bool isLowerThanMax(Comparable val, Max annotation) {
  if(val == null ) return false;
  var comparison = val.compareTo(annotation.maxVal);
  return (annotation.isMaxInclusive && comparison <= 0 || !annotation.isMaxInclusive && comparison < 0);
}

/// Specify that the attribute value should be lower than [maxVal] or lower or equal that [maxVal] if [isMaxInclusive] is true
class Max extends NotNull {
  const Max(this.maxVal, {this.description, this.isMaxInclusive: true});

  final String description;
  final Comparable maxVal;
  final bool isMaxInclusive;

  String get defaultDescription => description != null ? description : "Value should be less than $maxVal";
  IsValidFunction2 get isValid2 => isLowerThanMax;
}

/// checks if [value] is in range
bool isInRange(Comparable value, Range annotation) => isGreaterThanMin(value, annotation) && isLowerThanMax(value, annotation);

/// Specify that the attribute value should be between [minVal] and [maxVal]
class Range extends NotNull implements Min, Max {
  const Range(this.minVal, this.maxVal, {this.description, this.isMaxInclusive: true, this.isMinInclusive: true});

  final String description;
  String get defaultDescription => description != null ? description : "Value should be between $minVal and $maxVal";
  final Comparable minVal;
  final Comparable maxVal;
  final bool isMinInclusive;
  final bool isMaxInclusive;

  IsValidFunction2 get isValid2 => isInRange;
}

/// checks if the [val] has length between min and max
hasLength(String val, Length annotation) =>
    isNotNull(val)
    && (annotation.min != null ? val.length >= annotation.min : true)
    && (annotation.max != null ? val.length <= annotation.max : true );

/// Annotation to check if the attribute has lenght between [min] and [max]
class Length extends NotNull {
  const Length({this.min, this.max, this.description});

  String get defaultDescription =>
      description != null
        ? description
        : min == null
          ? "Length should be Lower than $max"
          : max == null
            ? "Length should be greather than $min"
            : "Length should be between $min and $max";

  final String description;
  final int max;
  final int min;

  IsValidFunction2 get isValid2 => hasLength;
}

/// checks if the [val] matches the regular expression passed to [annotation]
matches(String val, Matches annotation) =>
    isNotNull(val) && validator.matches(val, annotation.regExp);

/// Annotation to check if the attribute matches the specified regular expression [regExp]
class Matches extends NotNull {

  const Matches(this.regExp, {this.description});

  String get defaultDescription =>
      description ?? 'value should match $regExp';

  final String description;
  final String regExp;

  IsValidFunction2 get isValid2 => matches;
}
