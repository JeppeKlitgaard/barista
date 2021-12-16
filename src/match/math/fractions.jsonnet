local g = import '../../lib/base.libsonnet';

local rawMatches = [
  // 2
  {
    triggers: ['half', '1/2'],
    replace: '½',
  },

  // 3
  {
    triggers: ['third', '1/3'],
    replace: '⅓',
  },
  {
    triggers: ['2/3'],
    replace: '⅔',
  },

  // 4
  {
    triggers: ['fourth', 'quarter', '1/4'],
    replace: '¼',
  },
  {
    triggers: ['3/4'],
    replace: '¾',
  },

  // 5
  {
    triggers: ['fifth', '1/5'],
    replace: '⅕',
  },
  {
    triggers: ['2/5'],
    replace: '⅖',
  },
  {
    triggers: ['3/5'],
    replace: '⅗',
  },
  {
    triggers: ['4/5'],
    replace: '⅘',
  },

  // 6
  {
    triggers: ['sixth', '1/6'],
    replace: '⅙',
  },
  {
    triggers: ['5/6'],
    replace: '⅚',
  },

  // 7
  {
    triggers: ['seventh', '1/7'],
    replace: '⅐',
  },

  // 8
  {
    triggers: ['eighth', '1/8'],
    replace: '⅛',
  },
  {
    triggers: ['3/8'],
    replace: '⅜',
  },
  {
    triggers: ['5/8'],
    replace: '⅝',
  },
  {
    triggers: ['7/8'],
    replace: '⅞',
  },

  // 9
  {
    triggers: ['ninth', '1/9'],
    replace: '⅑',
  },

  // 10
  {
    triggers: ['tenth', '1/10'],
    replace: '⅒',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
