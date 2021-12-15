local g = import '../../../lib/base.libsonnet';

local rawMatches = [
  {
    trigger: 'eszett',
    replace: 'ß',
  },
  {
    trigger: 'Eszett',
    replace: 'ẞ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
