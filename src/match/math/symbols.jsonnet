local g = import '../../lib/base.libsonnet';

local rawMatches = [
  //## Infinity
  {
    triggers: ['i', 'inf', 'infty'],
    replace: '∞',
  },

  //## Fancy
  // E
  {
    triggers: ['euler', 'e'],
    replace: '𝑒',
  },

  // L
  {
    triggers: ['ell', 'l'],
    replace: 'ℓ',
  },
  {
    triggers: ['Ell', 'L'],
    replace: 'ℒ',
  },

  // F
  {
    triggers: ['fourier', 'Fourier', 'ft', 'FT'],
    replace: 'ℱ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
