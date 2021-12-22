local asciiUpperArray(arr) = [
    std.asciiUpper(element)
    for element in arr
];

local asciiCapitalise = function(str)
    local strs = std.stringChars(str);
    local firstChar = std.asciiUpper(strs[0]);

    local newStrs = [firstChar] + strs[1:];

    std.join("", newStrs);


local asArray = function(elementOrArray)
    if std.isArray(elementOrArray)
        then elementOrArray
        else [elementOrArray];


local asciiStringToCaseTuple = function(strOrStrs)

    local strs = asArray(strOrStrs);

    local newStrs = [
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
        std.uniq(std.sort(cases))

        for str in strs
    ];

    std.flattenArrays(newStrs);


local stringArrayOuterProduct = function(input1, input2)
    // Input is either string or array of strings
    local array1 = asArray(input1);
    local array2 = asArray(input2);

    local output = [
        element1 + element2
        for element1 in array1
        for element2 in array2
    ];

    output;


local nStringArrayOuterProduct = function(outerArr)
    local outputs = if std.length(outerArr) > 2
        then
            // [
            stringArrayOuterProduct(
                outerArr[0],
                nStringArrayOuterProduct(outerArr[1:])
            )
        else
            stringArrayOuterProduct(outerArr[0], outerArr[1]);

    outputs;


local renderArray = function(array, pre, post)
    nStringArrayOuterProduct([pre, array, post]);


local renderKeyOfTriggers = function(obj, preKeyOrKeys, postKeyOrKeys, preValue, postValue)
    {
        local value = obj[key],

        [preKey + key + postKey]+: if std.isArray(value)
            then renderArray(value, preValue, postValue)
            else nStringArrayOuterProduct([preValue, value, postValue])

        for preKey in asArray(preKeyOrKeys)
        for postKey in asArray(postKeyOrKeys)
        for key in std.objectFields(obj)
    };


{
    asciiUpperArray: asciiUpperArray,
    asciiCapitalise: asciiCapitalise,
    asciiStringToCaseTuple: asciiStringToCaseTuple,
    asArray: asArray,
    renderArray: renderArray,
    renderKeyOfTriggers: renderKeyOfTriggers,
    nStringArrayOuterProduct: nStringArrayOuterProduct,
    stringArrayOuterProduct: stringArrayOuterProduct,
}
