local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_ITALIC;
local POST = g.POST_ITALIC;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝑎', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝐴', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
