local g = import '../../../lib/base.libsonnet';

local preTrigger = g.PRE_FRAKTUR;
local postTrigger = g.POST_FRAKTUR;

local lowerOverrides = {};
local upperOverrides = {
  C: 'ℭ',
  H: 'ℌ',
  I: 'ℑ',
  R: 'ℜ',
  Z: 'ℨ',
};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝔞', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝔄', upperOverrides);

local rawHits = lower + upper;
local matches = g.processTriggers(rawHits, preTrigger, postTrigger);


g.renderDocument(std.thisFile, matches)
