local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['neq', '=/', '!='],
    replace: '≠',
  },

  {
    triggers: ['equiv', 'eq', '3-'],
    replace: '≡',
  },
  {
    triggers: ['!equiv', '!eq', '!3-'],
    replace: '≢',
  },

  {
    triggers: ['4-'],
    replace: '≣',
  },

  # Equalities
  {
    triggers: [':='],
    replace: '≔',
  },
  {
    triggers: ['=:'],
    replace: '≕',
  },
  {
    triggers: ['=.'],
    replace: '≐',
  },
  {
    triggers: ['=o'],
    replace: '≗',
  },
  {
    triggers: ['=^'],
    replace: '≙',
  },
  {
    triggers: ['=v'],
    replace: '≚',
  },
  {
    triggers: ['=*'],
    replace: '≛',
  },
  {
    triggers: ['=D'],
    replace: '≜',
  },
  {
    triggers: ['=def'],
    replace: '≝',
  },
  {
    triggers: ['=m'],
    replace: '≞',
  },
  {
    triggers: ['=?'],
    replace: '≟',
  },
  {
    triggers: ['=~'],
    replace: '≅',
  },

  # Approx
  {
    triggers: ['~'],
    replace: '∼',
  },
  {
    triggers: ['approx', 'a', '~~'],
    replace: '≈',
  },
  {
    triggers: ['!approx', '!a', '!~~'],
    replace: '≉',
  },
  {
    triggers: ['~~~'],
    replace: '≋',
  },
  {
    triggers: ['-~', 'sim', 'simeq'],
    replace: '≃',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
