part of drails_validator;


/// This is the return result from [validate] function, it contains the [errors] and the [isValid] getter
class ValidationResult {
  Map<String, List<String>> errors = {};
  
  bool get isValid => errors.isEmpty;
}

/// validate the specified [entity] and returns a result of type [ValidationResult]
ValidationResult validate(entity) {
  //create a ValidationResult object
  var result = new ValidationResult();
  
  //reflect entity
  var entityIm = reflect(entity);
    //for each declaration (ie. attributes, getters, setters and other methods)
    entityIm.type.declarations.forEach((declarationSymbol, declarationMirror) {
      //get annotations where annotation of type VaidIf
      declarationMirror.metadata.where((annotationIm) => annotationIm.reflectee is ValidIf)
      //for each annotation
      .forEach((annotationIm) {
        //get the annotation reflectee
        ValidIf annotation = annotationIm.reflectee;
        // if the attribute value is not valid
        if(annotation.isValid != null && !annotation.isValid(entityIm.getField(declarationSymbol).reflectee)
            || annotation.isValid2 != null && !annotation.isValid2(entityIm.getField(declarationSymbol).reflectee, annotation)) {
          //get the attribute name
          var declarationName = MirrorSystem.getName(declarationSymbol);
          //and add the errors to the result.errors map
          result.errors
            ..putIfAbsent(declarationName, () => new List<String>())
            ..[declarationName].add(annotation.description);
        }
      });
    });
    return result;
}
