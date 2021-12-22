local g = import '../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  'such that': 'st',
  'coordinate system': ['cs', 'coordsys'],
  'with respect to': 'wrt',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
