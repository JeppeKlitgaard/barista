local g = import '../../../lib/base.libsonnet';


local PRE = g.PRE_DIACRITIC;
local POST = g.POST_ACUTE;


local rawHits = g.replacementTableToHits({
  //## Symbol
     '´': "'",

  //## Lower case
     'á': 'a',
     'ć': 'c',
     'é': 'e',
     'ǵ': 'g',
     'í': 'i',
     'ḱ': 'k',
     'ĺ': 'l',
     'ḿ': 'm',
     'ń': 'n',
     'ó': 'o',
     'ṕ': 'p',
     'ŕ': 'r',
     'ś': 's',
     'ú': 'u',
     'ẃ': 'w',
     'ý': 'y',
     'ź': 'z',

  //## Upper case
     'Á': 'A',
     'Ć': 'C',
     'É': 'E',
     'Ǵ': 'G',
     'Í': 'I',
     'Ḱ': 'K',
     'Ĺ': 'L',
     'Ḿ': 'M',
     'Ń': 'N',
     'Ó': 'O',
     'Ṕ': 'P',
     'Ŕ': 'R',
     'Ś': 'S',
     'Ú': 'U',
     'Ẃ': 'W',
     'Ý': 'Y',
     'Ź': 'Z',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, PRE, POST),
  }
)
