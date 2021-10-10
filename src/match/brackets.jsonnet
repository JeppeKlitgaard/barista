local g = import '../lib/base.libsonnet';

local rawMatches = [

  # 〈〉
  {
    trigger: '</',
    replace: '〈',
  },
  {
    trigger: '/>',
    replace: '〉',
  },

  # 《》
  {
    trigger: '<+',
    replace: '《',
  },
  {
    trigger: '>+',
    replace: '》',
  },

  # «»
  {
    trigger: '<_',
    replace: '«',
  },
  {
    trigger: '>_',
    replace: '»',
  },

  # ⌈ ⌉ ⌊ ⌋
  {
    trigger: '|^',
    replace: '⌈',
  },
  {
    trigger: '^|',
    replace: '⌉',
  },
  {
    trigger: '|_',
    replace: '⌊',
  },
  {
    trigger: '_|',
    replace: '⌋',
  },

  # 『』
  {
    trigger: '<"',
    replace: '『',
  },
  {
    trigger: '>"',
    replace: '』',
  },

  # 【】
  {
    trigger: '("',
    replace: '【',
  },
  {
    trigger: ')"',
    replace: '】',
  },

  # 〔〕
  {
    trigger: "('",
    replace: '〔',
  },
  {
    trigger: ")'",
    replace: '〕',
  },

  # 〖〗
  {
    trigger: '(I',
    replace: '〖',
  },
  {
    trigger: ')I',
    replace: '〗',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
