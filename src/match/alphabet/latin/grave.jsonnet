local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_GRAVE;


local rawHits = g.replacementTableToHits({
  //## Symbol
  '`': "'",

  //## Lower case
  'à': 'a',
  'è': 'e',
  'ì': 'i',
  'ò': 'o',
  'ù': 'u',
  'ẁ': 'w',
  'ỳ': 'y',

  //## Upper case
  'À': 'A',
  'È': 'E',
  'Ì': 'I',
  'Ò': 'O',
  'Ù': 'U',
  'Ẁ': 'W',
  'Ỳ': 'Y',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
