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
  //get the annotations over the entity InstanceMirror
  var aoi = new GetValuesOfAnnotations<ValidIf>().fromInstance(entityIm);
  //if the entity has annotations over its class
  if(aoi != null) 
    //for each annotation over the class of the entity
    aoi.forEach((entityAnnotation) {
      if(entityAnnotation != null && entityAnnotation.isValid != null && !entityAnnotation.isValid(entity)) {
        //TODO: chose a name for this error
        result.errors
            ..putIfAbsent('', () => new List<String>())
            ..[''].add(entityAnnotation.description);
      }
    });
  
  //for each attribute of the entity
  var pvfc = getPublicVariablesFromClass(entityIm.type);
  if(pvfc != null)
    pvfc.forEach((declarationSymbol, declarationMirror) {
      //get annotations where annotation of type VaidIf
      var aod = new GetValuesOfAnnotations<ValidIf>().fromDeclaration(declarationMirror);
      if(aod != null)
        //for each annotation
        aod.forEach((annotation) {
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
