local asciiUpperArray(arr) = [
    std.asciiUpper(element)
    for element in arr
];

local asciiCapitalise = function(str)
    local strs = std.stringChars(str);
    local firstChar = std.asciiUpper(strs[0]);

    local newStrs = [firstChar] + strs[1:];

    std.join("", newStrs);

local asciiStringToCaseTuple = function(str)
    local lower = std.asciiLower(str);
    local capitalise = asciiCapitalise(str);
    local upper = std.asciiUpper(str);

    local cases = [
        str,
        lower,
        capitalise,
        upper,
    ];

    // Dedup
    std.uniq(std.sort(cases));

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


local stringArrayOuterProduct = function(array1, array2)
    local output = [
        element1 + element2
        for element1 in array1
        for element2 in array2
    ];

    output;

{
    asciiUpperArray: asciiUpperArray,
    asciiCapitalise: asciiCapitalise,
    asciiStringToCaseTuple: asciiStringToCaseTuple,
    asArray: asArray,
    renderArray: renderArray,
    renderKeyOfTriggers: renderKeyOfTriggers,
    stringArrayOuterProduct: stringArrayOuterProduct,
}
