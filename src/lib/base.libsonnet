local SRC_KEY = 'src';

/*
# Concepts

## Replacement table
A replacement table is an object where the key is the replacement
and the value is an array of triggers

Example:
{
    "∫": ["integral", "int"],
    "∬": ["dintegral", "iint"],
},

## Matches
Matches is an array of objects that match the espanso matches configuration
property

*/

local replacementTableToMatches(replacementTable) = [
    {
        [if std.isArray(replacementTable[replacement]) then "triggers" else "trigger"]:
            replacementTable[replacement],

        replace: replacement,
    },
    for replacement in std.objectFields(replacementTable)
];

local processFilename(filename) =
    local baseDir = std.thisFile;
    local split = std.split(filename, "/");

    // Find position of key
    local keyIdx = std.find(SRC_KEY, split)[0];

    local partsStart = keyIdx + 1;
    local partsEnd = std.length(split) - 1;

    // Strip .jsonnet from basename
    local basename = std.split(split[partsEnd], ".")[0];

    local parts = split[partsStart : partsEnd] + [basename];

    std.join("_", parts);


local addPrePost(trigger, pre, post) =
    pre + trigger + post;


local processTriggers(rawMatches, pre, post) = [
    # Function that adds the specified pre/post triggers the triggers of
    # a matches array
    match + {
        [if 'triggers' in match then 'triggers']:
            [
                addPrePost(trigger, pre, post)

                for trigger in match['triggers']
            ],

        [if 'trigger' in match then 'trigger']: addPrePost(match['trigger'], pre, post),
    }
    for match in rawMatches
];


local processExtras(rawMatches, extras) = [
    # Function that adds extra fields to an array of matches
    # extras should be an array of the attributes to add to each match
    match + {
        [extra]: extras[extra]
        for extra in std.objectFields(extras)
    }
    for match in rawMatches
];


local generateUnicodeMatches(normalStartChar, normalEndChar, newStartChar, overrides={}) = [
    local length = std.codepoint(normalEndChar) - std.codepoint(normalStartChar);

    local normalChars = [
        std.char(std.codepoint(normalStartChar) + i)
        for i in std.range(0, length)
    ];
    local rawNewChars = [
        std.char(std.codepoint(newStartChar) + i)
        for i in std.range(0, length)
    ];
    local newChars = [
        local normalChar = normalChars[i];
        local rawNewChar = rawNewChars[i];

        if std.objectHas(overrides, normalChar)
        then overrides[normalChar] else rawNewChar,

        for i in std.range(0, length)
    ];

    {
        local normalChar = std.char(std.codepoint(normalStartChar) + i),
        local rawNewChar = std.char(std.codepoint(newStartChar) + i),

        local newChar = if std.objectHas(overrides, normalChar)
        then overrides[normalChar] else rawNewChar,

        trigger: normalChar,
        replace: newChar,
    },

    for i in std.range(
        0,
        std.codepoint(normalEndChar) - std.codepoint(normalStartChar),
    )
];


{
    PARENT: 'default',
    PRE: ':',
    POST: ' ',

    PRE_DIACRITIC: ',',
    PRE_BBB: self.PRE + 'bb',

    PRE_FRAKTUR: self.PRE + 'fk',
    PRE_FRAKTUR_BOLD: self.PRE_FRAKTUR + 'b',

    PRE_GREEK_BBB: self.PRE_BBB + ";",

    processFilename: processFilename,
    processTriggers: processTriggers,
    processExtras: processExtras,
    generateUnicodeMatches: generateUnicodeMatches,
    replacementTableToMatches: replacementTableToMatches,
}
