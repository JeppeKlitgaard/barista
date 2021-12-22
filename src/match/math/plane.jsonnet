local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '⊗': ['into'],  // Also defined in circle_operators as 'ox'
  '⊙': ['outof'],  // Also defined in circle_operators as 'o.'
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
