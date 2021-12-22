local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Limits
  '_{-∞}^{+∞}': ['ii'],
  '_0^{+∞}': ['i0'],
  '_{-∞}^0': ['0i'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
