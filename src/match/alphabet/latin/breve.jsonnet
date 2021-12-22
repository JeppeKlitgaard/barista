local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_BREVE;


local rawHits = g.replacementTableToHits({
  //## Symbol
  '˘': "'",

  //## Lower case
  'ă': 'a',
  'ĕ': 'e',
  'ğ': 'g',
  'ĭ': 'i',
  'ŏ': 'o',
  'ŭ': 'u',

  //## Upper case
  'Ă': 'A',
  'Ĕ': 'E',
  'Ğ': 'G',
  'Ĭ': 'I',
  'Ŏ': 'O',
  'Ŭ': 'U',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
