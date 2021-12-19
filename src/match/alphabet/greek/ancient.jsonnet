local g = import '../../../lib/base.libsonnet';


local rawMatches = g.replacementTableToHits({

  'ϙ': 'qoppa',
  'Ϙ': ['Qoppa', 'QOPPA'],
  'ϟ': ['nqoppa', 'numqoppa'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
