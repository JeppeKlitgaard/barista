local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '(' + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: '˘',
  },

  ### Lower case
  {
    trigger: 'a',
    replace: 'ă',
  },
  {
    trigger: 'e',
    replace: 'ĕ',
  },
  {
    trigger: 'g',
    replace: 'ğ',
  },
  {
    trigger: 'i',
    replace: 'ĭ',
  },
  {
    trigger: 'o',
    replace: 'ŏ',
  },
  {
    trigger: 'u',
    replace: 'ŭ',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Ă',
  },
  {
    trigger: 'E',
    replace: 'Ĕ',
  },
  {
    trigger: 'G',
    replace: 'Ğ',
  },
  {
    trigger: 'I',
    replace: 'Ĭ',
  },
  {
    trigger: 'O',
    replace: 'Ŏ',
  },
  {
    trigger: 'U',
    replace: 'Ŭ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
