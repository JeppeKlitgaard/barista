local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_FRAKTUR;
local POST = g.POST_FRAKTUR;

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


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
