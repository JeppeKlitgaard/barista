local g = import '../../lib/base.libsonnet';

local PRE = g.PRE + '_';
local POST = g.POST;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '₀');


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
