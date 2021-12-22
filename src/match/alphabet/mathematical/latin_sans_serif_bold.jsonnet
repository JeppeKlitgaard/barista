local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SANS_SERIF_BOLD;
local POST = g.POST_SANS_SERIF_BOLD;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝗮', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝗔', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
