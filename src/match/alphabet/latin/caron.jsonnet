local g = import '../../../lib/base.libsonnet';

local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '<' + g.POST;

local rawMatches = [
  //## Symbol
  {
    trigger: "'",
    replace: 'ˇ',
  },

  //## Lower case
  {
    trigger: 'a',
    replace: 'ǎ',
  },
  {
    trigger: 'c',
    replace: 'č',
  },
  {
    trigger: 'd',
    replace: 'ď',
  },
  {
    trigger: 'e',
    replace: 'ě',
  },
  {
    trigger: 'g',
    replace: 'ǧ',
  },
  {
    trigger: 'i',
    replace: 'ǐ',
  },
  {
    trigger: 'j',
    replace: 'ǰ',
  },
  {
    trigger: 'k',
    replace: 'ǩ',
  },
  {
    trigger: 'l',
    replace: 'ľ',
  },
  {
    trigger: 'n',
    replace: 'ň',
  },
  {
    trigger: 'o',
    replace: 'ǒ',
  },
  {
    trigger: 'r',
    replace: 'ř',
  },
  {
    trigger: 's',
    replace: 'š',
  },
  {
    trigger: 't',
    replace: 'ť',
  },
  {
    trigger: 'u',
    replace: 'ǔ',
  },
  {
    trigger: 'z',
    replace: 'ž',
  },

  //## Upper case
  {
    trigger: 'A',
    replace: 'Ǎ',
  },
  {
    trigger: 'C',
    replace: 'Č',
  },
  {
    trigger: 'D',
    replace: 'Ď',
  },
  {
    trigger: 'E',
    replace: 'Ě',
  },
  {
    trigger: 'G',
    replace: 'Ǧ',
  },
  {
    trigger: 'I',
    replace: 'Ǐ',
  },
  {
    trigger: 'J',
    replace: 'J̌',
  },
  {
    trigger: 'K',
    replace: 'Ǩ',
  },
  {
    trigger: 'L',
    replace: 'Ľ',
  },
  {
    trigger: 'N',
    replace: 'Ň',
  },
  {
    trigger: 'O',
    replace: 'Ǒ',
  },
  {
    trigger: 'R',
    replace: 'Ř',
  },
  {
    trigger: 'S',
    replace: 'Š',
  },
  {
    trigger: 'T',
    replace: 'Ť',
  },
  {
    trigger: 'U',
    replace: 'Ǔ',
  },
  {
    trigger: 'Z',
    replace: 'Ž',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
