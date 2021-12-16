local g = import '../../../lib/base.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '!' + g.POST;

local rawMatches = [
  //## Symbol
  {
    trigger: "'",
    replace: '`',
  },

  //## Lower case
  {
    trigger: 'a',
    replace: 'à',
  },
  {
    trigger: 'e',
    replace: 'è',
  },
  {
    trigger: 'i',
    replace: 'ì',
  },
  {
    trigger: 'o',
    replace: 'ò',
  },
  {
    trigger: 'u',
    replace: 'ù',
  },
  {
    trigger: 'w',
    replace: 'ẁ',
  },
  {
    trigger: 'y',
    replace: 'ỳ',
  },

  //## Upper case
  {
    trigger: 'A',
    replace: 'À',
  },
  {
    trigger: 'E',
    replace: 'È',
  },
  {
    trigger: 'I',
    replace: 'Ì',
  },
  {
    trigger: 'O',
    replace: 'Ò',
  },
  {
    trigger: 'U',
    replace: 'Ù',
  },
  {
    trigger: 'W',
    replace: 'Ẁ',
  },
  {
    trigger: 'Y',
    replace: 'Ỳ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
