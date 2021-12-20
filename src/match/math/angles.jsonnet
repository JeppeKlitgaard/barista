local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∠': ['angle', '<'],
  '∟': ['rangle'],
  '∡': ['mangle'],
  '∢': ['sangle'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
