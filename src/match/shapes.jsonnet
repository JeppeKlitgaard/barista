local g = import '../lib/base.libsonnet';

local rawMatches = [
  //## Square
  {
    triggers: ['sq', 'square'],  // Also defined in square_operators as '|=|
    replace: '◻',
  },

  //## Triangle
  {
    triggers: ['<|', 'ltangle'],
    replace: '◁',
  },
  {
    triggers: ['|>', 'rtangle'],
    replace: '▷',
  },

  //## Other shapes
  {
    triggers: ['tangle', 'triangle'],
    replace: '⊿',
  },
  {
    triggers: ['house'],
    replace: '⌂',
  },
  {
    triggers: ['arc', 'arch'],
    replace: '⌒',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
