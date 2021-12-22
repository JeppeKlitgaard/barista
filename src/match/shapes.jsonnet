local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Square
  '◻': ['sq', 'square'],  // Also defined in square_operators as '|=|

  //## Triangle
  '◁': ['<|', 'ltangle'],
  '▷': ['|>', 'rtangle'],

  //## Other shapes
  '⊿': ['tangle', 'triangle'],
  '⌂': ['house'],
  '⌒': ['arc', 'arch'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
