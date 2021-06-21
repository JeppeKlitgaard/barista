local g = import '../lib/base.libsonnet';

local rawMatches = [
  ### Degree
  {
    triggers: ['deg','^o'],
    replace: '°',
  },

  ### Radian
  {
    triggers: ['rad','^c'],
    replace: 'ᶜ',
  },
  {
    triggers: ['urad'],
    replace: '㎭',
  },

  ### Gradian
  {
    triggers: ['grad','^g'],
    replace: 'ᵍ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
