local g = import '../../lib/base.libsonnet';

local PRE = g.PRE + '^';
local POST = g.POST;

local overrides = {
  '1': '¹',
  '2': '²',
  '3': '³',
};

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '⁰', overrides);


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
