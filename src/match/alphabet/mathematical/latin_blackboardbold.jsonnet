local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_BBB;
local POST = g.POST;

local lowerOverrides = {};
local upperOverrides = {
  C: 'ℂ',
  H: 'ℍ',
  N: 'ℕ',
  P: 'ℙ',
  Q: 'ℚ',
  R: 'ℝ',
  Z: 'ℤ',
};

local lower = g.generateHitsFromStartAndEndChars('a', 'z', '𝕒', lowerOverrides);
local upper = g.generateHitsFromStartAndEndChars('A', 'Z', '𝔸', upperOverrides);

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
