local g = import '../../../lib/base.libsonnet';

local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = ',' + g.POST;

local rawMatches = [
  //## Symbol
  {
    trigger: "'",
    replace: '¸',
  },

  //## Lower case
  {
    trigger: 'c',
    replace: 'ç',
  },
  {
    trigger: 'd',
    replace: 'ḑ',
  },
  {
    trigger: 'g',
    replace: 'ģ',
  },
  {
    trigger: 'h',
    replace: 'ḩ',
  },
  {
    trigger: 'k',
    replace: 'ķ',
  },
  {
    trigger: 'l',
    replace: 'ļ',
  },
  {
    trigger: 'n',
    replace: 'ņ',
  },
  {
    trigger: 'r',
    replace: 'ŗ',
  },
  {
    trigger: 's',
    replace: 'ş',
  },
  {
    trigger: 't',
    replace: 'ţ',
  },

  //## Upper case
  {
    trigger: 'C',
    replace: 'Ç',
  },
  {
    trigger: 'D',
    replace: 'Ḑ',
  },
  {
    trigger: 'G',
    replace: 'Ģ',
  },
  {
    trigger: 'H',
    replace: 'Ḩ',
  },
  {
    trigger: 'K',
    replace: 'Ķ',
  },
  {
    trigger: 'L',
    replace: 'Ļ',
  },
  {
    trigger: 'N',
    replace: 'Ņ',
  },
  {
    trigger: 'R',
    replace: 'Ŗ',
  },
  {
    trigger: 'S',
    replace: 'Ş',
  },
  {
    trigger: 'T',
    replace: 'Ţ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
