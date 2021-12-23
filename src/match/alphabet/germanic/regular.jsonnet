local g = import '../../../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  'ß': ['eszett', 'ss'],
  'ẞ': ['Eszett', 'Ss', 'SS'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
