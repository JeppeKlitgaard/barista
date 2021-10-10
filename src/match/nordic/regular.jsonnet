local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local rawMatches = [
  {
    trigger: 'ae',
    replace: 'æ',
  },
  {
    trigger: 'o/',
    replace: 'ø',
  },
  {
    trigger: 'aa',
    replace: 'å',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
