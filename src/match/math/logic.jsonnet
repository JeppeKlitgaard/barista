local g = import '../../lib/base.libsonnet';

local rawMatches = [
  ### And/or
  {
    triggers: ['and', '^'],
    replace: '∧',
  },
  {
    triggers: ['And', '^^'],
    replace: '⋀',
  },

  {
    triggers: ['or', 'v'],
    replace: 'v',
  },
  {
    triggers: ['Or', 'V'],
    replace: '⋁',
  },

  ### Negation
  {
    triggers: ['neg'],
    replace: '¬',
  },
  {
    triggers: ['Neg'],
    replace: '￢',
  },

  ### Truth/falsum
  {
    triggers: ['true', 't'],
    replace: '〒',
  },
  {
    triggers: ['True', 'T'],
    replace: '┳',
  },
  {
    triggers: ['false', 'f'],
    replace: '⊥',
  },
  {
    triggers: ['False', 'F'],
    replace: '┻',
  },

  ### Turnstiles
  # Single
  {
    triggers: ['|-'],
    replace: '⊢',
  },
  {
    triggers: ['!|-'],
    replace: '⊬',
  },

  {
    triggers: ['-|'],
    replace: '⊣',
  },

  # Double
  {
    triggers: ['|='],
    replace: '⊨',
  },
  {
    triggers: ['!|='],
    replace: '⊭',
  },

  # Other
  {
    triggers: ['||-'],
    replace: '⊩',
  },
  {
    triggers: ['!||-'],
    replace: '⊮',
  },

  {
    triggers: ['||='],
    replace: '⊫',
  },
  {
    triggers: ['!||='],
    replace: '⊯',
  },

  {
    triggers: ['|||-'],
    replace: '⊪',
  },

  # Both sides
  {
    triggers: ['-||-'],
    replace: '⟛',
  },
  {
    triggers: ['=||='],
    replace: '⟚',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
