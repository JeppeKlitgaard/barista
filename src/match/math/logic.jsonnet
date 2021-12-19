local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## And/or
  '∧': ['and', '^'],
  '⋀': ['And', '^^'],

  'v': ['or', 'v'],
  '⋁': ['Or', 'V'],

  //## Negation
  '¬': ['neg'],
  '￢': ['Neg'],

  //## Truth/falsum
  '〒': ['true', 't'],
  '┳': ['True', 'T'],
  '⊥': ['false', 'f'],
  '┻': ['False', 'F'],

  //## Turnstiles
  // Single
  '⊢': ['|-'],
  '⊬': ['!|-'],

  '⊣': ['-|'],

  // Double
  '⊨': ['|='],
  '⊭': ['!|='],

  // Other
  '⊩': ['||-'],
  '⊮': ['!||-'],

  '⊫': ['||='],
  '⊯': ['!||='],

  '⊪': ['|||-'],

  // Both sides
  '⟛': ['-||-'],
  '⟚': ['=||='],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
