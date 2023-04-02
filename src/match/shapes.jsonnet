local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Square
  '◻': ['sq', 'square'],  // Also defined in square_operators as '|=|
  '■': ['fsq', 'filledsquare'],

  //## Triangle
  '◁': ['<|', 'ltangle'],
  '▷': ['|>', 'rtangle'],

  //## Other shapes
  '⊿': ['tangle', 'triangle'],
  '⌂': ['house'],
  '⌒': ['arc', 'arch'],

  //## Filled circles
  '⬤': ['DDot', 'ddddot'],
  '●': ['Dot', 'dddot'],
  '•': ['ddot', 'bullet'],
  '⋅': ['dot'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
