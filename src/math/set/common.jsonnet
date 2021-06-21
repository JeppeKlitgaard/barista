local g = import '../../lib/base.libsonnet';

local rawMatches = [
  ### Predefined sets
  {
    triggers: ['emptyset', 'empty', 'O\\'],
    replace: '∅',
  },

  ### Common sets
  # Note these are also defined in alphabet/latin/bbb.jsonnet
  {
    triggers: ['N'],
    replace: 'ℕ',
  },
  {
    triggers: ['Z'],
    replace: 'ℤ',
  },
  {
    triggers: ['Q'],
    replace: 'ℚ',
  },
  {
    triggers: ['R'],
    replace: 'ℝ',
  },
  {
    triggers: ['I'],
    replace: '𝕀',
  },
  {
    triggers: ['C'],
    replace: 'ℂ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
