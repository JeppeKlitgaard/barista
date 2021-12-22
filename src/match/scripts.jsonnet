local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
