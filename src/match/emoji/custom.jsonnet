local g = import '../../lib/base.libsonnet';

local rawMatches = [
  //## Yes/No/Maybe
  {
    triggers: [
      'y',
      'yes',
    ],
    replace: '✔',
  },
  {
    triggers: [
      'n',
      'no',
    ],
    replace: '❌',
  },
  {
    triggers: [
      'm',
      'maybe',
    ],
    replace: '🟡',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
