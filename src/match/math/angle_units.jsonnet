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


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
