local g = import '../../../lib/base.libsonnet';

local PRE = 'MATHBOLD';
local POST = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝙖', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝘼', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
