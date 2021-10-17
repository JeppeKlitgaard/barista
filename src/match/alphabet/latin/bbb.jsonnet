local g = import '../../../lib/base.libsonnet';
local m = import '../../../lib/modifiers.libsonnet';

local pre_trigger = g.PRE_BBB;
local post_trigger = g.POST;

local normal_lower = g.generateUnicodeArray('a', g.LATIN_ALPHABET_LENGTH);
local normal_upper = g.generateUnicodeArray('A', g.LATIN_ALPHABET_LENGTH);

local bb_lower_ = g.generateUnicodeArray('𝕒', g.LATIN_ALPHABET_LENGTH);
local bb_upper_ = g.generateUnicodeArray('𝔸', g.LATIN_ALPHABET_LENGTH);
# bb_upper needs some manual fixing due to common math BB being defined in
# different codepoint range

local bb_upper_fix =
    m.many([
        m.change([2], 'ℂ'),
        m.change([7], 'ℍ'),
        m.change([13], 'ℕ'),
        m.change([15], 'ℙ'),
        m.change([16], 'ℚ'),
        m.change([17], 'ℝ'),
        m.change([25], 'ℤ'),
    ])
    (bb_upper_);

local normal = normal_lower + normal_upper;
local bb = bb_lower_ + bb_upper_fix;

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
