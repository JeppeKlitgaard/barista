local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_TILDE;


local rawHits = g.replacementTableToHits({
  //## Lower case
     'ã': 'a',
     'ẽ': 'e',
     'ĩ': 'i',
     'ñ': 'n',
     'õ': 'o',
     'ũ': 'u',
     'ṽ': 'v',
     'ỹ': 'y',

  //## Upper case
     'Ã': 'A',
     'Ẽ': 'E',
     'Ĩ': 'I',
     'Ñ': 'N',
     'Õ': 'O',
     'Ũ': 'U',
     'Ṽ': 'V',
     'Ỹ': 'Y',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, PRE, POST),
  }
)
