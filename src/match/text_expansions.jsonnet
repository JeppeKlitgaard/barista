local g = import '../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  'such that': 'st',
  'coordinate system': ['cs', 'coordsys'],
  'with respect to': 'wrt',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
