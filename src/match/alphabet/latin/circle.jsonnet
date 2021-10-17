local g = import '../../../lib/base.libsonnet';
local m = import '../../../lib/modifiers.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '0' + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: '˚',
  },

  ### Lower case
  {
    trigger: 'u',
    replace: 'ů',
  },
  {
    trigger: 'w',
    replace: 'ẘ',
  },
  {
    trigger: 'y',
    replace: 'ẙ',
  },

  ### Upper case
  {
    trigger: 'U',
    replace: 'Ů',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
