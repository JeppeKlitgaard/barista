local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: [
      'st',
    ],
    replace: 'such that',
  },
  {
    triggers: [
      'cs',
      'coordsys',
    ],
    replace: 'coordinate system',
  },
  {
    triggers: [
      'wrt',
    ],
    replace: 'with respect to',
  },


];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
