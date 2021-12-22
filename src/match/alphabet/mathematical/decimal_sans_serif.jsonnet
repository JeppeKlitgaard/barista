local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_SANS_SERIF;
local POST = g.POST_SANS_SERIF;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '𝟢');


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
