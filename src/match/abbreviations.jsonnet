local g = import '../lib/base.libsonnet';

local rawMatches = [
  # Section
  {
    triggers: [
      'tldr',
    ],
    replace: 'TL;DR',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
