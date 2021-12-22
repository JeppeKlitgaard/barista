local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SANS_SERIF_BOLD;
local POST = g.POST_SANS_SERIF_BOLD;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '𝟬');


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
