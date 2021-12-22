local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_FRAKTUR_BOLD;
local POST = g.POST;

local lowerOverrides = {};
local upperOverrides = {
  C: 'ℭ',
  H: 'ℌ',
  I: 'ℑ',
  R: 'ℜ',
  Z: 'ℨ',
};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝖆', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝕬', upperOverrides);

local rawHits = lower + upper;
local matches = g.processTriggers(rawHits, PRE, POST);


g.renderDocument(std.thisFile, matches)
