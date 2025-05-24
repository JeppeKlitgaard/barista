local g = import '../../../lib/base.libsonnet';

// Those missing from: https://www.compart.com/en/unicode/search?q=Mathematical+Script+Small#characters
local lowerOverrides = {
  e: 'ℯ',  // Script small e
  g: 'ℊ',  // Script small g
  o: 'ℴ',  // Script small o
};

// Those missing from: https://www.compart.com/en/unicode/search?q=Mathematical+Script+Capital#characters
local upperOverrides = {
  B: 'ℬ',  // Script capital B
  E: 'ℰ',  // Script capital E
  F: 'ℱ',  // Script capital F
  H: 'ℋ',  // Script capital H
  I: 'ℐ',  // Script capital I
  L: 'ℒ',  // Script capital L
  M: 'ℳ',  // Script capital M
  R: 'ℛ',  // Script capital R
};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝒶', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝒜', upperOverrides);

local appendReplace = function(hits, appendage)
  [
    hit + {
      replace: hit.replace + appendage,
    }
    for hit in hits
  ];

local lower_script = appendReplace(lower, g.SCRIPT_UNICODE_MODIFIER);
local upper_script = appendReplace(upper, g.SCRIPT_UNICODE_MODIFIER);

local lower_calligraphic = appendReplace(lower, g.CALLIGRAPHIC_UNICODE_MODIFIER);
local upper_calligraphic = appendReplace(upper, g.CALLIGRAPHIC_UNICODE_MODIFIER);

local rawHitsScript = lower_script + upper_script;
local rawHitsCalligraphic = lower_calligraphic + upper_calligraphic;

local triggersScript = g.renderTriggersAndHits(rawHitsScript, g.PRE_SCRIPT, g.POST_SCRIPT);
local triggersCalligraphic = g.renderTriggersAndHits(rawHitsCalligraphic, g.PRE_CALLIGRAPHIC, g.POST_CALLIGRAPHIC);

g.renderDocument(
  std.thisFile,
  triggersScript + triggersCalligraphic,
)
