local g = import '../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['sine','ac'],
    replace: '∿',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
