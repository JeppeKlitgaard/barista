local g = import '../../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['|=|'],
    replace: '◻',
  },
  {
    triggers: ['|+|'],
    replace: '⊞',
  },
  {
    triggers: ['|-|'],
    replace: '⊟',
  },
  {
    triggers: ['|x|', '|X|'],
    replace: '⊠',
  },
  {
    triggers: ['|.|'],
    replace: '⊡',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
