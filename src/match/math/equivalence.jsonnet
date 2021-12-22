local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '≠': ['neq', '=/', '!='],

  '≡': ['equiv', 'eq', '3-'],
  '≢': ['!equiv', '!eq', '!3-'],

  '≣': ['4-'],

  // Equalities
  '≔': [':='],
  '≕': ['=:'],
  '≐': ['=.'],
  '≗': ['=o'],
  '≙': ['=^'],
  '≚': ['=v'],
  '≛': ['=*'],
  '≜': ['=D'],
  '≝': ['=def'],
  '≞': ['=m'],
  '≟': ['=?'],
  '≅': ['=~'],

  // Approx
  '∼': ['~'],
  '≈': ['approx', 'a', '~~'],
  '≉': ['!approx', '!a', '!~~'],
  '≋': ['~~~'],
  '≃': ['-~', 'sim', 'simeq'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
