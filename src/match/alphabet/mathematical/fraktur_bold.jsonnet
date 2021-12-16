local g = import '../../../lib/base.libsonnet';

local preTrigger = g.PRE_FRAKTUR_BOLD;
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {
  C: 'ℭ',
  H: 'ℌ',
  I: 'ℑ',
  R: 'ℜ',
  Z: 'ℨ',
};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝖆', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝕬', upperOverrides);

local rawMatches = lower + upper;
local matches = g.processTriggers(rawMatches, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
