local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local sequenceLength = g.DECIMAL_ALPHABET_LENGTH;
local pre_trigger = g.PRE + "^";
local post_trigger = g.POST;

local normal = g.generateUnicodeArray('0', sequenceLength);
local replacement = g.generateUnicodeArray('⁰', sequenceLength);

local replacement_fix =
    m.many([
        m.change([1], '¹'),
        m.change([2], '²'),
        m.change([3], '³'),
    ])
    (replacement);

local rawMatches = [
    {
        trigger: normal[i],
        replace: replacement_fix[i],
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
