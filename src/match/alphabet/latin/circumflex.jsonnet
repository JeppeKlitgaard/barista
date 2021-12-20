local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_CIRCUMFLEX;


local rawHits = g.replacementTableToHits({
  //## Symbol
  'ˆ': "'",

  //## Lower case
  'â': 'a',
  'ĉ': 'c',
  'ê': 'e',
  'ĝ': 'g',
  'ĥ': 'h',
  'î': 'i',
  'ĵ': 'j',
  'ô': 'o',
  'ŝ': 's',
  'û': 'u',
  'ŵ': 'w',
  'ŷ': 'y',
  'ẑ': 'z',

  //## Upper case
  'Â': 'A',
  'Ĉ': 'C',
  'Ê': 'E',
  'Ĝ': 'G',
  'Ĥ': 'H',
  'Î': 'I',
  'Ĵ': 'J',
  'Ô': 'O',
  'Ŝ': 'S',
  'Û': 'U',
  'Ŵ': 'W',
  'Ŷ': 'Y',
  'Ẑ': 'Z',
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.renderTriggersAndHits(rawHits, PRE, POST),
}
