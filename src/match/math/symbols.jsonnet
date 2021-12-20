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


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
