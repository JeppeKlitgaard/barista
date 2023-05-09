local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∫': ['int'],
  '∬': ['iint'],
  '∭': ['iiint'],
  '⨌': ['iiiint'],

  //## Limits
  '∫_0^∞': ['inti'],
  '∫_∞^∞': ['intii'],

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


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
