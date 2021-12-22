local config = import 'config.libsonnet';
local consts = import 'consts.libsonnet';
local filters = import 'filters.libsonnet';
local hit = import 'hit.libsonnet';
local utils = import 'utils.libsonnet';

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


local processFilename(filename) =
    local baseDir = std.thisFile;
    local split = std.split(filename, "/");

    // Find position of key
    local srcKeyIdx = std.find(SRC_KEY, split)[0];
    local keyIdx = srcKeyIdx + 1;  // To remove match_

    local partsStart = keyIdx + 1;
    local partsEnd = std.length(split) - 1;

    // Strip .jsonnet from basename
    local basename = std.split(split[partsEnd], ".")[0];

    local parts = split[partsStart : partsEnd] + [basename];

    std.join("_", parts);


local renderDocument = function(thisFile, matches, parent=config.PARENT)
    local doc = {
        name: processFilename(thisFile),
        parent: parent,

        matches: matches,
    };

    doc;


local addPropertiesToHits(rawHits, properties) = [
    # Function that adds extra fields to an array of matches
    # extras should be an array of the attributes to add to each match
    match + {
        [propertyName]: properties[propertyName]
        for propertyName in std.objectFields(properties)
    }
    for match in rawHits
];


local generateHit = function(
    triggerOrTriggers,
    rawReplacement,
    triggerOverrides,
)
    local triggers = utils.asArray(triggerOrTriggers);

    local replacements = [
        triggerOverrides[trigger]
        for trigger in triggers
        if trigger in triggerOverrides
    ];

    assert std.length(replacements) < 2 : "Found multiple replacements in override!";

    local replacement = if std.length(replacements) == 1
        then replacements[0]
        else rawReplacement;

    {
        triggers: triggers,
        replace: replacement,
    };


local generateHitsFromUnicodeSequence = function(
    normalChars,
    newStartChar,
    overrides = {},
)
    local length = std.length(normalChars);

    local newChars = [
        std.char(std.codepoint(newStartChar) + i)
        for i in std.range(0, length)
    ];

    local hits = [
        generateHit(
            normalChars[i],
            newChars[i],
            overrides,
        )
        for i in std.range(0, length - 1)
    ];

    hits;


local generateHitsFromStartAndEndChars = function(
    normalStartChar,
    normalEndChar,
    newStartChar,
    overrides = {},
)
    local length = std.codepoint(normalEndChar) - std.codepoint(normalStartChar);

    local normalChars = [
        std.char(std.codepoint(normalStartChar) + i)
        for i in std.range(0, length)
    ];

    generateHitsFromUnicodeSequence(normalChars, newStartChar, overrides);

local renderTriggers = function(hits, preTrigger, postTrigger)
    [
        hit + {
            triggers: [
                preTrigger + trigger + postTrigger
                for trigger in hit.triggers
            ]
        },
        for hit in hits
    ];


local addAdditionalTriggersByTrigger = function(hits, additionalTriggersByTrigger)
    [
        local additionalTriggers = [
            local _additionalTriggers = utils.asArray(additionalTriggersByTrigger[additionalTriggerKey]);
            local shouldAddTriggers = std.member(hit.triggers, additionalTriggerKey);

            if shouldAddTriggers
                then _additionalTriggers
                else null
            for additionalTriggerKey in std.objectFields(additionalTriggersByTrigger)
        ];

        local processedAdditionalTriggers =
            std.uniq(
                std.sort(
                    std.flattenArrays(
                        std.prune(additionalTriggers)
                    )
                )
            );

        hit + {
            triggers+: processedAdditionalTriggers,
        }

        for hit in hits
    ];


local addAdditionalTriggersByReplacement = function(hits, additionalTriggersByReplacement)
    [
        local additionalTriggers = if hit.replace in additionalTriggersByReplacement
            then utils.asArray(additionalTriggersByReplacement[hit.replace])
            else [];

        hit + {
            triggers+: additionalTriggers
        }

        for hit in hits
    ];


{
    processFilename: processFilename,
    renderDocument: renderDocument,
    renderTriggers: renderTriggers,
    addPropertiesToHits: addPropertiesToHits,
    addAdditionalTriggersByTrigger: addAdditionalTriggersByTrigger,
    addAdditionalTriggersByReplacement: addAdditionalTriggersByReplacement,
    generateHitsFromUnicodeSequence: generateHitsFromUnicodeSequence,
    generateHitsFromStartAndEndChars: generateHitsFromStartAndEndChars,
}
+ config
+ consts
+ filters
+ hit
+ utils
