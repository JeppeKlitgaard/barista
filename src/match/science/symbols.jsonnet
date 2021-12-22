local g = import '../../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  // Hbar
  'ℏ': 'hbar',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
