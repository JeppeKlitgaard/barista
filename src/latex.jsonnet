local g = import 'lib/base.libsonnet';

local rawMatches = [
  ### Limits
  {
    triggers: ['ii'],
    replace: '_{-∞}^{+∞}',
  },
  {
    triggers: ['i0'],
    replace: '_0^{+∞}',
  },
  {
    triggers: ['0i'],
    replace: '_{-∞}^0',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
