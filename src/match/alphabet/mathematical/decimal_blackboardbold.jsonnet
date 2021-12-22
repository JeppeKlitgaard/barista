local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_BBB;
local POST = g.POST;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '𝟘');


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
