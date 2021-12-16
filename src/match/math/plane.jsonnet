local g = import '../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['into'],  // Also defined in circle_operators as 'ox'
    replace: '⊗',
  },
  {
    triggers: ['outof'],  // Also defined in circle_operators as 'o.'
    replace: '⊙',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
