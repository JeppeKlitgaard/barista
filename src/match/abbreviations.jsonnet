local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  'TL;DR': 'tldr',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
