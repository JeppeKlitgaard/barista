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


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, PRE, POST),
  }
)
