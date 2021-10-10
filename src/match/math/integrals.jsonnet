local g = import '../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['int'],
    replace: '∫',
  },
  {
    triggers: ['iint'],
    replace: '∬',
  },
  {
    triggers: ['iiint'],
    replace: '∭',
  },
  {
    triggers: ['iiiint'],
    replace: '⨌',
  },

  ### Contour
  {
    triggers: ['oint'],
    replace: '∮',
  },
  {
    triggers: ['oiint'],
    replace: '∯',
  },
  {
    triggers: ['oiiint'],
    replace: '∰',
  },

  ### Directional
  {
    triggers: ['rint'],
    replace: '∱',
  },
  {
    triggers: ['lint'],
    replace: '⨑',
  },

  {
    triggers: ['roint'],
    replace: '∲',
  },
  {
    triggers: ['loint'],
    replace: '∳',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
