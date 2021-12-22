local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '‰': ['permille', '%0'],
  '‱': ['per10k', '%00'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
