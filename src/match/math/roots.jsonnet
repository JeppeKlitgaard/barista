local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '√': ['sqrt', '2rt', 'root'],
  '∛': ['cbrt', '3rt'],
  '∜': ['4rt'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
