local g = import '../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  // Punctuation
  '¿': '?',
  '¡': '!',
  '‽': ['?!', '!?'],

  // Marks
  '™': 'tm',
  '©': 'cr',

  // Fancy plus
  '✠': '+',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
