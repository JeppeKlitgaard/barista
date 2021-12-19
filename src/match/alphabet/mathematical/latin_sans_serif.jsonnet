local g = import '../../../lib/base.libsonnet';

local preTrigger = 'MATHBOLD';
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝖺', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝖠', upperOverrides);

local rawHits = lower + upper;
local matches = g.processTriggers(rawHits, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
