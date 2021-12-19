local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∫': ['int'],
  '∬': ['iint'],
  '∭': ['iiint'],
  '⨌': ['iiiint'],

  //## Contour
  '∮': ['oint'],
  '∯': ['oiint'],
  '∰': ['oiiint'],

  //## Directional
  '∱': ['rint'],
  '⨑': ['lint'],

  '∲': ['roint'],
  '∳': ['loint'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
