local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '√': ['sqrt', '2rt', 'root'],
  '∛': ['cbrt', '3rt'],
  '∜': ['4rt'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
