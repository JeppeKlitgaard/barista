local g = import '../../../lib/base.libsonnet';

local preTrigger = 'MATHBOLD';
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝚊', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝙰', upperOverrides);

local rawHits = lower + upper;
local matches = g.processTriggers(rawHits, preTrigger, postTrigger);


g.renderDocument(std.thisFile, matches)
