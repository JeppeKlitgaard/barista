local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '℃': ['degc', '^oc'],
  '℉': ['degf', '^of'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
