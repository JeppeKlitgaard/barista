local g = import '../../../lib/base.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = ';' + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: '˛',
  },

  ### Lower case
  {
    trigger: 'a',
    replace: 'ą',
  },
  {
    trigger: 'e',
    replace: 'ę',
  },
  {
    trigger: 'i',
    replace: 'į',
  },
  {
    trigger: 'o',
    replace: 'ǫ',
  },
  {
    trigger: 'u',
    replace: 'ų',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Ą',
  },
  {
    trigger: 'E',
    replace: 'Ę',
  },
  {
    trigger: 'I',
    replace: 'Į',
  },
  {
    trigger: 'O',
    replace: 'Ǫ',
  },
  {
    trigger: 'U',
    replace: 'Ų',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
