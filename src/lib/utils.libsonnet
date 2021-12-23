local asciiutils = import 'asciiutils.libsonnet';


local asArray = function(elementOrArray)
    if std.isArray(elementOrArray)
        then elementOrArray
        else [elementOrArray];


local asciiStringToCaseTuple = function(
    strOrStrs,
    toLower=true,
    toCapitalise=true,
    toUpper=true,
    toSelf=true
    )

    local strs = asArray(strOrStrs);

    local newStrs = [
        local cases = [
            if toSelf then str else null,
            if toLower then asciiutils.asciiLower(str) else null,
            if toCapitalise then asciiutils.asciiCapitalise(str) else null,
            if toUpper then asciiutils.asciiUpper(str) else null,
        ];

        // Dedup
        std.uniq(std.sort(std.prune(cases)))

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


local compositeStringArrayOuterProduct = function(outerArr)
    // outerArr is array of parts
    // where parts are arrays of options

    local strs = nStringArrayOuterProduct(outerArr);
    local lowers = nStringArrayOuterProduct(asciiutils.asciiLower(outerArr));
    local capitalises = nStringArrayOuterProduct(asciiutils.asciiCapitalise(outerArr));
    local uppers = nStringArrayOuterProduct(asciiutils.asciiUpper(outerArr));

    local combined = strs + lowers + capitalises + uppers;

    std.uniq(std.sort(combined));


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
    asciiStringToCaseTuple: asciiStringToCaseTuple,
    asArray: asArray,
    renderArray: renderArray,
    renderKeyOfTriggers: renderKeyOfTriggers,
    stringArrayOuterProduct: stringArrayOuterProduct,
    nStringArrayOuterProduct: nStringArrayOuterProduct,
    compositeStringArrayOuterProduct: compositeStringArrayOuterProduct,
} + asciiutils
