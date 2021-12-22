local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_MATH_BOLD;
local POST = g.POST_MATH_BOLD;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝐚', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝐀', upperOverrides);

local rawHits = lower + upper;
local matches = g.processTriggers(rawHits, PRE, POST);

g.renderDocument(std.thisFile, matches)
