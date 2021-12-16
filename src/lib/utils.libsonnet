local asciiUpperArray(arr) = [
    std.asciiUpper(element)
    for element in arr
];

local asArray = function(elementOrArray)
    if std.isArray(elementOrArray)
        then elementOrArray
        else [elementOrArray];

local renderArray = function(array, pre, post)
    [
        pre + element + post
        for element in array
    ];

local renderKeyOfTriggers = function(obj, preKey, postKey, preValue, postValue)
    {
        local value = obj[key],

        [preKey + key + postKey]: if std.isArray(value)
            then renderArray(value, preValue, postValue)
            else preValue + value + postValue

        for key in std.objectFields(obj)
    };

{
    asciiUpperArray: asciiUpperArray,
    asArray: asArray,
    renderArray: renderArray,
    renderKeyOfTriggers: renderKeyOfTriggers,
}
