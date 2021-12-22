local g = import '../../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Predefined sets
  '∅': ['emptyset', 'empty', 'O\\'],

  //## Common sets
  // Note these are also defined in alphabet/latin/bbb.jsonnet
  'ℕ': ['N'],
  'ℤ': ['Z'],
  'ℚ': ['Q'],
  'ℝ': ['R'],
  '𝕀': ['I'],
  'ℂ': ['C'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
