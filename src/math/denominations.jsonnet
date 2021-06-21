local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['permille', '%0'],
    replace: '‰',
  },
  {
    triggers: ['per10k', '%00'],
    replace: '‱',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
