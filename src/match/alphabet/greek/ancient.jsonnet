local g = import '../../../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  // Qoppa
  'ϙ': 'qoppa',
  'Ϙ': ['Qoppa', 'QOPPA'],
  'ϟ': ['nqoppa', 'numqoppa'],

  // Sampi
  'ϡ': 'sampi',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
