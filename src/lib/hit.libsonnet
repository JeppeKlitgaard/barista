/*
# Hits
A hit has the layout described below.

Note: They are guaranteed to use 'triggers' and never 'trigger'

local ExampleHit = {
    triggers: ["a"],
    replace: "A",
    // Other optional fields
};
*/

local utils = import 'utils.libsonnet';


local hitToMatch = function(hit)
    local isTriggers = std.length(hit.triggers) > 1;

    local triggerKey = if isTriggers
        then "triggers"
        else "trigger";

    local triggerValue = if isTriggers
        then hit.triggers
        else hit.triggers[0];

    local otherItems =
        {
            [k]: hit[k]
            for k in std.objectFields(hit)
            if !(k == "trigger" || k == "triggers")
        };

    {
        [triggerKey]: triggerValue,
    } + otherItems;


local hitsToMatches = function(hits)
    [
        hitToMatch(hit)
        for hit in hits
    ];

local replacementTableToHits(replacementTable) = [
    {
        triggers: utils.asArray(replacementTable[replacement]),
        replace: replacement,
    },
    for replacement in std.objectFields(replacementTable)
];

local renderHits = function(hits)
    hitsToMatches(hits);

{
    hitToMatch: hitToMatch,
    hitsToMatches: hitsToMatches,
    replacementTableToHits: replacementTableToHits,
    renderHits: renderHits,
}