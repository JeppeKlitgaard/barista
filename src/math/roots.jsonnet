local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['sqrt', '2rt', 'root'],
    replace: '√',
  },
  {
    triggers: ['cbrt', '3rt'],
    replace: '∛',
  },
  {
    triggers: ['4rt'],
    replace: '∜',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
