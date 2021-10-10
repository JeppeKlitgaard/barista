local g = import '../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['degc','^oc'],
    replace: '℃',
  },
  {
    triggers: ['degf','^of'],
    replace: '℉',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
