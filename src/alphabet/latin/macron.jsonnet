local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '-' + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: '¯',
  },

  ### Lower case
  {
    trigger: 'a',
    replace: 'ā',
  },
  {
    trigger: 'd',
    replace: 'ð',
  },
  {
    trigger: 'e',
    replace: 'ē',
  },
  {
    trigger: 'g',
    replace: 'ḡ',
  },
  {
    trigger: 'i',
    replace: 'ī',
  },
  {
    trigger: 'o',
    replace: 'ō',
  },
  {
    trigger: 'u',
    replace: 'ū',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Ā',
  },
  {
    trigger: 'D',
    replace: 'Ð',
  },
  {
    trigger: 'E',
    replace: 'Ē',
  },
  {
    trigger: 'G',
    replace: 'Ḡ',
  },
  {
    trigger: 'I',
    replace: 'Ī',
  },
  {
    trigger: 'O',
    replace: 'Ō',
  },
  {
    trigger: 'U',
    replace: 'Ū',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
