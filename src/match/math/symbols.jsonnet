local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Infinity
  '∞': ['i', 'inf', 'infty'],

  //## Fancy
  // E
  '𝑒': ['euler', 'e'],

  // L
  'ℓ': ['ell', 'l'],
  'ℒ': ['Ell', 'L'],

  // F
  'ℱ': ['fourier', 'Fourier', 'ft', 'FT'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
