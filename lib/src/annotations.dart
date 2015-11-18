part of drails_validator;

/// This annotation specifies the object can be validated
class Validable extends Reflectable {
  const Validable() : super(
      typeAnnotationQuantifyCapability,
      superclassQuantifyCapability,
      invokingCapability,
      declarationsCapability,
      metadataCapability,
      newInstanceCapability,
      typeRelationsCapability,
      typeCapability);
}

/// This annotation specifies the object can be validated
const validable = const Validable();


/// Type of function that should be implemented for validation
typedef bool IsValidFunction(porpertyVal);

typedef bool IsValidFunction2(porpertyVal, ValidIf annotation);

/// Checks if the object or attribute accomplish the isValid function, for example:
/// 
///     _equalsTo5(int attr) => attr == 5;
/// 
///     class ObjectWithValidIf {
///       @ValidIf(_equalsTo5, 'Value should be equals to 5')
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
class ValidIf {
  const ValidIf(this.isValid, {this.customDescription});

  final String customDescription;
  String get description => customDescription != null ? customDescription : "";
  final IsValidFunction isValid;
  final IsValidFunction2 isValid2 = null;
}

/// checks if the value is not null
bool isNotNull(val) => val != null;

/// Shorthand for [NotNull]
const notNull = const NotNull();

/// annotation to check if the attribute is not null
class NotNull implements ValidIf {
  const NotNull([this.customDescription]);
  
  final String customDescription;

  @override
  String get description => customDescription != null ? customDescription : "Value should not be null";

  @override
  IsValidFunction get isValid => isNotNull;
  IsValidFunction2 get isValid2 => null;
}

/// Checks if the [value] is not empty (null is treated as empty)
bool isNotEmpty(value) => isNotNull(value) && value.isNotEmpty;

/// Shorthand for [NotEmpty]
const notEmpty = const NotEmpty();

/// Annotation to check if the value is not Empty (null is treated as empty)
class NotEmpty extends NotNull {
  final String customDescription;
  String get description => "Value should not be empty";
  IsValidFunction get isValid => isNotEmpty;
  
  const NotEmpty({this.customDescription});
}

/// chekcs if the [value] is greater than 
bool isGreaterThanMin(Comparable value, Min me) {
  if(value == null) return false;
  var comparison = value.compareTo(me.minVal);
  return (me.isMinInclusive && comparison >= 0 || !me.isMinInclusive && comparison > 0);
}

class Min extends NotNull {
  const Min(this.minVal, {this.customDescription, this.isMinInclusive: true});
  
  final String customDescription;
  final Comparable minVal;
  final bool isMinInclusive;

  String get description => customDescription != null ? customDescription : "Value should be greater than $minVal";

  IsValidFunction2 get isValid2 => isGreaterThanMin;
}

bool isLowerThanMax(Comparable val, Max annotation) {
  if(val == null ) return false;
  var comparison = val.compareTo(annotation.maxVal);
  return (annotation.isMaxInclusive && comparison <= 0 || !annotation.isMaxInclusive && comparison < 0);
}

/// Specify that the attribute value should be lower than [maxVal] or lower or equal that [maxVal] if [isMaxInclusive] is true
class Max extends NotNull {
  const Max(this.maxVal, {this.customDescription, this.isMaxInclusive: true});
  
  final String customDescription;
  final Comparable maxVal;
  final bool isMaxInclusive;

  String get description => customDescription != null ? customDescription : "Value should be less than $maxVal";
  IsValidFunction2 get isValid2 => isLowerThanMax;
}

/// checks if [value] is in range
bool isInRange(Comparable value, Range annotation) => isGreaterThanMin(value, annotation) && isLowerThanMax(value, annotation);

/// Specify that the attribute value should be between [minVal] and [maxVal]
class Range extends NotNull implements Min, Max {
  const Range(this.minVal, this.maxVal, {this.customDescription, this.isMaxInclusive: true, this.isMinInclusive: true});

  final String customDescription;
  String get description => customDescription != null ? customDescription : "Value should be between $minVal and $maxVal";
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
  const Length({this.min, this.max, this.customDescription});

  String get description => 
      customDescription != null 
        ? customDescription 
        : min == null 
          ? "Length should be Lower than $max" 
          : max == null 
            ? "Length should be greather than $min" 
            : "Length should be between $min and $max";
  
  final String customDescription;
  final int max;
  final int min;

  IsValidFunction2 get isValid2 => hasLength;
}

/// checks if the [val] matches the regular expression passed to [annotation]
matches(String val, Matches annotation) =>isNotNull(val) && validator.matches(val, annotation.regExp);

/// Annotation to check if the attribute matches the specified regular expression [regExp]
class Matches extends NotNull {

  const Matches(this.regExp, {this.customDescription});

  String get description =>
      customDescription ?? 'value should match $regExp';

  final String customDescription;
  final String regExp;

  IsValidFunction2 get isValid2 => matches;
}