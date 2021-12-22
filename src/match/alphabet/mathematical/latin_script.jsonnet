local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SCRIPT;
local POST = g.POST_SCRIPT;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝒶', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝒜', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
