local g = import '../../../lib/base.libsonnet';

local preTrigger = 'MATHBOLD';
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝑎', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝐴', upperOverrides);

local rawHits = lower + upper;
local matches = g.processTriggers(rawHits, preTrigger, postTrigger);


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: matches,
}
