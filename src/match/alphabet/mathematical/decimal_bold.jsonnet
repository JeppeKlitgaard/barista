local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_BOLD;
local POST = g.POST_BOLD;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '𝟎');


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
