local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local sequenceLength = g.DECIMAL_ALPHABET_LENGTH;
local pre_trigger = g.PRE + "_";
local post_trigger = g.POST;

local normal = g.generateUnicodeArray('0', sequenceLength);
local replacement = g.generateUnicodeArray('₀', sequenceLength);

local rawMatches = [
    {
        trigger: normal[i],
        replace: replacement[i],
    },
    for i in std.range(0, std.length(normal) - 1)
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
