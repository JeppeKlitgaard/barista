local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_DIAERESIS;


local rawHits = g.replacementTableToHits({
  //## Symbol
     '¨¨': "'",

  //## Lower case
     'ä': 'a',
     'ë': 'e',
     'ḧ': 'h',
     'ï': 'i',
     'ö': 'o',
     'ẗ': 't',
     'ü': 'u',
     'ẅ': 'w',
     'ẍ': 'x',
     'ÿ': 'y',

  //## Upper case
     'Ä': 'A',
     'Ë': 'E',
     'Ḧ': 'H',
     'Ï': 'I',
     'Ö': 'O',
     'Ü': 'U',
     'Ẅ': 'W',
     'Ẍ': 'X',
     'Ÿ': 'Y',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, PRE, POST),
  }
)
