local g = import '../lib/base.libsonnet';


local rawMatches = g.replacementTableToHits({
  'such that': 'st',
  'coordinate system': ['cs', 'coordsys'],
  'with respect to': 'wrt',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
