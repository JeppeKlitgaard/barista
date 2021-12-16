local g = import '../../../lib/base.libsonnet';

local preTrigger = g.PRE_BBB;
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {
  C: 'ℂ',
  H: 'ℍ',
  N: 'ℕ',
  P: 'ℙ',
  Q: 'ℚ',
  R: 'ℝ',
  Z: 'ℤ',
};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝕒', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝔸', upperOverrides);

local rawMatches = lower + upper;
local matches = g.processTriggers(rawMatches, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
