local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_MONO;
local POST = g.POST_MONO;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝚊', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝙰', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
