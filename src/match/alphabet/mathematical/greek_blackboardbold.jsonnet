local g = import '../../../lib/base.libsonnet';

local pre_trigger = g.PRE_GREEK_BBB;
local post_trigger = g.POST;

local rawMatches = [
  {
    trigger: 'p',
    replace: 'ℼ',
  },
  {
    trigger: 'P',
    replace: 'ℿ',
  },
  {
    trigger: 'g',
    replace: 'ℽ',
  },
  {
    trigger: 'G',
    replace: 'ℾ',
  },
  {
    trigger: 'S',
    replace: '⅀',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
