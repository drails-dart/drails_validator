part of drails_validator;


/// This is the return result from [validate] function, it contains the [errors] and the [isValid] getter
class ValidationResult {
  Map<String, List<String>> errors = {};

  bool get isValid => errors.isEmpty;

  toString() => 'isValid: $isValid, errors: $errors';
}

/// validate the specified [entity] and returns a result of type [ValidationResult]
ValidationResult validate(SerializableMap entity) {
  //create a ValidationResult object
  var result = new ValidationResult();
  //reflect entity
  var entityCm = reflect(entity);
  // get the annotations over the entity InstanceMirror
  var aoi = entityCm.annotations?.where((a) => a is ValidIf)?.cast<ValidIf>();
  //if the entity has annotations over its class
  if (aoi != null)
    //for each annotation over the class of the entity
    aoi.forEach((entityAnnotation) {
      if (entityAnnotation != null && entityAnnotation.isValid != null && !entityAnnotation.isValid(entity)) {
        //TODO: chose a name for this error
        result.errors
          ..putIfAbsent('', () => new List<String>())
          ..[''].add(entityAnnotation.defaultDescription);
      }
    });

  //for each attribute of the entity
  entityCm.fields.forEach((declarationName, declarationMirror) {
    //get annotations of declarations where annotation is type ValidIf
    var aod = declarationMirror.annotations?.where((a) => a is ValidIf)?.cast<ValidIf>();
    if (aod != null)
      //for each annotation
      aod.forEach((annotation) {
        if(annotation.iff == null || annotation.iff(entity)){
          // if the attribute value is not valid
          if (annotation.isValid != null && !annotation.isValid(entity[declarationName])
              || annotation.isValid2 != null && !annotation.isValid2(entity[declarationName], annotation)) {
            // and add the errors to the result.errors map
            result.errors
              ..putIfAbsent(declarationName, () => new List<String>())
              ..[declarationName].add(annotation.defaultDescription);
          }
        }
      });
  });

  return result;
}
