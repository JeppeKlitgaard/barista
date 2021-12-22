local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SCRIPT_BOLD;
local POST = g.POST_SCRIPT_BOLD;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝓪', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝓐', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
