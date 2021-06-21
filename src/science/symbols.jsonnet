local g = import '../lib/base.libsonnet';

local rawMatches = [
  # Hbar
  {
    trigger: 'hbar',
    replace: 'ℏ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
