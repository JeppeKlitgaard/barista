local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Limits
  '_{-∞}^{+∞}': ['ii'],
  '_0^{+∞}': ['i0'],
  '_{-∞}^0': ['0i'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
