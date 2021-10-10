local g = import '../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['angle', '<'],
    replace: '∠',
  },
  {
    triggers: ['rangle'],
    replace: '∟',
  },
  {
    triggers: ['mangle'],
    replace: '∡',
  },
  {
    triggers: ['sangle'],
    replace: '∢',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
