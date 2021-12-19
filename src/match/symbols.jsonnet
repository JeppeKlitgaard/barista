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


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
  }
)
