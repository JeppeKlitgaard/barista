local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '~' + g.POST;

local rawMatches = [
  ### Lower case
  {
    trigger: 'a',
    replace: 'ã',
  },
  {
    trigger: 'e',
    replace: 'ẽ',
  },
  {
    trigger: 'i',
    replace: 'ĩ',
  },
  {
    trigger: 'n',
    replace: 'ñ',
  },
  {
    trigger: 'o',
    replace: 'õ',
  },
  {
    trigger: 'u',
    replace: 'ũ',
  },
  {
    trigger: 'v',
    replace: 'ṽ',
  },
  {
    trigger: 'y',
    replace: 'ỹ',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Ã',
  },
  {
    trigger: 'E',
    replace: 'Ẽ',
  },
  {
    trigger: 'I',
    replace: 'Ĩ',
  },
  {
    trigger: 'N',
    replace: 'Ñ',
  },
  {
    trigger: 'O',
    replace: 'Õ',
  },
  {
    trigger: 'U',
    replace: 'Ũ',
  },
  {
    trigger: 'V',
    replace: 'Ṽ',
  },
  {
    trigger: 'Y',
    replace: 'Ỹ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
