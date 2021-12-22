local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_OGONEK;


local rawHits = g.replacementTableToHits({
  //## Symbol
  '˛': "'",

  //## Lower case
  'ą': 'a',
  'ę': 'e',
  'į': 'i',
  'ǫ': 'o',
  'ų': 'u',

  //## Upper case
  'Ą': 'A',
  'Ę': 'E',
  'Į': 'I',
  'Ǫ': 'O',
  'Ų': 'U',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
