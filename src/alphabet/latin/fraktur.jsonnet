local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local preTrigger = g.PRE_FRAKTUR;
local postTrigger = g.POST;

local preBoldTrigger = g.PRE_FRAKTUR_BOLD;
local postBoldTrigger = g.POST;

local normalLower = g.generateUnicodeArray('a', g.LATIN_ALPHABET_LENGTH);
local normalUpper = g.generateUnicodeArray('A', g.LATIN_ALPHABET_LENGTH);

local fkLower = g.generateUnicodeArray('𝔞', g.LATIN_ALPHABET_LENGTH);
local fkUpper = g.generateUnicodeArray('𝔄', g.LATIN_ALPHABET_LENGTH);

local fkBoldLower = g.generateUnicodeArray('𝖆', g.LATIN_ALPHABET_LENGTH);
local fkBoldUpper = g.generateUnicodeArray('𝕬', g.LATIN_ALPHABET_LENGTH);

local fkUpperFix =
    m.many([
        m.change([2], 'ℭ'),
        m.change([7], 'ℌ'),
        m.change([8], 'ℑ'),
        m.change([17], 'ℜ'),
        m.change([25], 'ℨ'),
    ])
    (fkUpper);


local normal = normalLower + normalUpper;
local fk = fkLower + fkUpperFix;
local fkBold = fkBoldLower + fkBoldUpper;

local fkRawMatches = [
    {
        trigger: normal[i],
        replace: fk[i],
    },
    for i in std.range(0, std.length(normal) - 1)
];

local fkBoldRawMatches = [
    {
        trigger: normal[i],
        replace: fkBold[i],
    },
    for i in std.range(0, std.length(normal) - 1)
];

local fkMatches = g.processTriggers(fkRawMatches, preTrigger, postTrigger);
local fkBoldMatches = g.processTriggers(fkBoldRawMatches, preBoldTrigger, postBoldTrigger);

local allMatches = fkMatches + fkBoldMatches;

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: allMatches
  }
)
