local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SANS_SERIF_ITALIC;
local POST = g.POST_SANS_SERIF_ITALIC;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝘢', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝘈', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
