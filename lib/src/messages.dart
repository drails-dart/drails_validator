part of drails_validator;

String valueIsInvalidMessage() => Intl.message('Value is invalid', name: 'valueIsInvalidMessage');

String valueShouldNotBeNullMessage() => Intl.message('Value should not be null', name: 'valueShouldNotBeNullMessage');

String valueShouldNotBeEmptyMessage() =>
    Intl.message('Value should not be empty', name: 'valueShouldNotBeEmptyMessage');

String valueShouldBeGreaterThanMessage(Min min) => _valueShouldBeGreaterThanMessage(min.minVal);

String _valueShouldBeGreaterThanMessage(minVal) =>
    Intl.message('Value should be greater than ${minVal}', name: '_valueShouldBeGreaterThanMessage', args: [minVal]);

String valueShouldBeLessThanMessage(Max max) => _valueShouldBeLessThanMessage(max.maxVal);

String _valueShouldBeLessThanMessage(maxVal) =>
    Intl.message("Value should be less than ${maxVal}", name: '_valueShouldBeLessThanMessage', args: [maxVal]);

String valueShouldBeBetweenMessage(Range range) => _valueShouldBeBetweenMessage(range.minVal, range.maxVal);

_valueShouldBeBetweenMessage(minVal, maxVal) => Intl.message("Value should be between ${minVal} and ${maxVal}",
    name: '_valueShouldBeBetweenMessage', args: [minVal, maxVal]);

String lengthShouldBeBetweenMessage(Length length) => length.min == null && length.max != null
    ? _lengthShouldBeLessThanMessage(length.max)
    : length.min != null && length.max == null
        ? _lengthShouldBeGreaterThanMessage(length.min)
        : _lengthShouldBeBetweenMessage(length.min, length.max);

String _lengthShouldBeBetweenMessage(min, max) =>
    Intl.message("Length should be between ${min} and ${max}", name: '_lengthShouldBeBetweenMessage', args: [min, max]);

String _lengthShouldBeGreaterThanMessage(min) =>
    Intl.message("Length should be greater than ${min}", name: '_lengthShouldBeGreaterThanMessage', args: [min]);

String _lengthShouldBeLessThanMessage(max) =>
    Intl.message("Length should be less than ${max}", name: '_lengthShouldBeLessThanMessage', args: [max]);

String valueShouldMatchMessage(Matches matches) => _valueShouldMatchMessage(matches.regExp);

String _valueShouldMatchMessage(regExp) =>
    Intl.message('value should match ${regExp}', name: '_valueShouldMatchMessage', args: [regExp]);
