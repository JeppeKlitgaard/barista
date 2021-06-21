local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['perpendicular', 'perp', '_|_'],
    replace: '⟂',
  },
  {
    triggers: ['parallel', 'para', '||'],
    replace: '∥',
  },
  {
    triggers: ['Parallel', 'Para', '||^'],
    replace: '‖',
  },
  {
    triggers: ['!parallel', '!para', '|/|'],
    replace: '∦',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
