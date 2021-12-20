local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '℃': ['degc', '^oc'],
  '℉': ['degf', '^of'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
