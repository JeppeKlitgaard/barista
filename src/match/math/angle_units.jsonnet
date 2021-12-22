local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Degree
  '°': ['deg', '^o'],

  //## Radian
  'ᶜ': ['rad', '^c'],
  '㎭': ['urad'],

  //## Gradian
  'ᵍ': ['grad', '^g'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
