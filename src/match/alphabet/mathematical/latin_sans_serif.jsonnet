local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SANS_SERIF;
local POST = g.POST_SANS_SERIF;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝖺', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝖠', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
