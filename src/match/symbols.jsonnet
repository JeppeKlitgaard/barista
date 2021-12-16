local g = import '../lib/base.libsonnet';

local rawMatches = [
  // Punctuation
  {
    trigger: '?',
    replace: '¿',
  },
  {
    trigger: '!',
    replace: '¡',
  },
  {
    triggers: ['?!', '!?'],
    replace: '‽',
  },

  // Marks
  {
    trigger: 'tm',
    replace: '™',
  },
  {
    trigger: 'cr',
    replace: '©',
  },

  // Fancy plus
  {
    trigger: '+',
    replace: '✠',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
