local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_CEDILLA;


local rawHits = g.replacementTableToHits({
  //## Symbol
  '¸': "'",

  //## Lower case
  'ç': 'c',
  'ḑ': 'd',
  'ģ': 'g',
  'ḩ': 'h',
  'ķ': 'k',
  'ļ': 'l',
  'ņ': 'n',
  'ŗ': 'r',
  'ş': 's',
  'ţ': 't',

  //## Upper case
  'Ç': 'C',
  'Ḑ': 'D',
  'Ģ': 'G',
  'Ḩ': 'H',
  'Ķ': 'K',
  'Ļ': 'L',
  'Ņ': 'N',
  'Ŗ': 'R',
  'Ş': 'S',
  'Ţ': 'T',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
