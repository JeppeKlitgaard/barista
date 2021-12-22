local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∠': ['angle', '<'],
  '∟': ['rangle'],
  '∡': ['mangle'],
  '∢': ['sangle'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
