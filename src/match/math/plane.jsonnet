local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '⊗': ['into'],  // Also defined in circle_operators as 'ox'
  '⊙': ['outof'],  // Also defined in circle_operators as 'o.'
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
