local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local pre_trigger = g.PRE_BBB;
local post_trigger = g.POST;

local normal = g.generateUnicodeArray('0', g.DECIMAL_ALPHABET_LENGTH);

local bb = g.generateUnicodeArray('𝟘', g.DECIMAL_ALPHABET_LENGTH);

local rawMatches = [
    {
        trigger: normal[i],
        replace: bb[i],
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
