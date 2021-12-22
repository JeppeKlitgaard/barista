local g = import '../../../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  'ß': 'eszett',
  'ẞ': 'Eszett',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
