local g = import '../../../lib/base.libsonnet';

local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '"' + g.POST;

local rawMatches = [
  //## Symbol
  {
    trigger: "'",
    replace: '˝',
  },

  //## Lower case
  {
    trigger: 'o',
    replace: 'ő',
  },
  {
    trigger: 'u',
    replace: 'ű',
  },

  //## Upper case
  {
    trigger: 'O',
    replace: 'Ő',
  },
  {
    trigger: 'U',
    replace: 'Ű',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
