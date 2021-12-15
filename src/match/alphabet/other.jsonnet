local g = import '../../lib/base.libsonnet';


local pre_trigger = g.PRE;
local post_trigger = g.POST;

local rawMatches = [
  {
    trigger: 'th',
    replace: 'þ',
  },
  {
    trigger: 'TH',
    replace: 'Þ',
  },

  {
    trigger: 'oe',
    replace: 'œ',
  },
  {
    trigger: 'OE',
    replace: 'Œ',
  },

  {
    trigger: 'ss',
    replace: 'ß',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
