local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_MONO;
local POST = g.POST_MONO;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '𝟶');


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
