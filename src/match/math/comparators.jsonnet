local g = import '../../lib/base.libsonnet';

local rawMatches = [
  # lte/gte
  {
    triggers: ['>=', 'geq'],
    replace: '≥',
  },
  {
    triggers: ['<=', 'leq'],
    replace: '≤',
  },

  {
    triggers: ['!>=', '!geq'],
    replace: '≱',
  },
  {
    triggers: ['!<=', '!leq'],
    replace: '≰',
  },

  # gg, ll
  {
    triggers: ['>>', 'gg'],
    replace: '≫',
  },
  {
    triggers: ['<<', 'll'],
    replace: '≪',
  },

  # ggg, lll
  {
    triggers: ['>>>', 'ggg'],
    replace: '⋙',
  },
  {
    triggers: ['<<<', 'lll'],
    replace: '⋘',
  },

  # Approximations
  {
    triggers: ['>~', 'g~'],
    replace: '≳',
  },
  {
    triggers: ['<~', 'l~'],
    replace: '≲',
  },

  {
    triggers: ['!>~', '!g~'],
    replace: '≱',
  },
  {
    triggers: ['!<~', '!l~'],
    replace: '≴',
  },

  # ltgt's
  {
    triggers: ['<>', 'ltgt'],
    replace: '≶',
  },
  {
    triggers: ['><', 'gtlt'],
    replace: '≷',
  },

  {
    triggers: ['!<>', '!ltgt'],
    replace: '≸',
  },
  {
    triggers: ['!><', '!gtlt'],
    replace: '≹',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
