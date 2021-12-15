local g = import '../../../lib/base.libsonnet';

local preTrigger = "MATHBOLD";
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateUnicodeMatches("a", "z", "𝚊", lowerOverrides);
local upper = g.generateUnicodeMatches("A", "Z", "𝙰", upperOverrides);

local rawMatches = lower + upper;
local matches = g.processTriggers(rawMatches, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
