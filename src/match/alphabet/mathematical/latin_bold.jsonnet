local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_BOLD;
local POST = g.POST_BOLD;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝐚', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝐀', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
