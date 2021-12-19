local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_CARON;


local rawHits = g.replacementTableToHits({
  //## Symbol
     'ˇ': "'",

  //## Lower case
     'ǎ': 'a',
     'č': 'c',
     'ď': 'd',
     'ě': 'e',
     'ǧ': 'g',
     'ǐ': 'i',
     'ǰ': 'j',
     'ǩ': 'k',
     'ľ': 'l',
     'ň': 'n',
     'ǒ': 'o',
     'ř': 'r',
     'š': 's',
     'ť': 't',
     'ǔ': 'u',
     'ž': 'z',

  //## Upper case
     'Ǎ': 'A',
     'Č': 'C',
     'Ď': 'D',
     'Ě': 'E',
     'Ǧ': 'G',
     'Ǐ': 'I',
     'J̌': 'J',
     'Ǩ': 'K',
     'Ľ': 'L',
     'Ň': 'N',
     'Ǒ': 'O',
     'Ř': 'R',
     'Š': 'S',
     'Ť': 'T',
     'Ǔ': 'U',
     'Ž': 'Z',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, PRE, POST),
  }
)
