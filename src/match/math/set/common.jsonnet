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


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
