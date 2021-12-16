local g = import '../../../lib/base.libsonnet';

local preTrigger = 'MATHBOLD';
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝙖', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝘼', upperOverrides);

local rawMatches = lower + upper;
local matches = g.processTriggers(rawMatches, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
