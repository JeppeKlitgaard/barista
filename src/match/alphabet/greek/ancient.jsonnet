local g = import '../../../lib/base.libsonnet';


local rawMatches = g.replacementTableToHits({
  // Qoppa
  'ϙ': 'qoppa',
  'Ϙ': ['Qoppa', 'QOPPA'],
  'ϟ': ['nqoppa', 'numqoppa'],

  // Sampi
  'ϡ': 'sampi',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
