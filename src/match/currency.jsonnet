local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['currency'],
    replace: '¤',
  },

  {
    triggers: ['cent'],
    replace: '¢',
  },

  {
    triggers: ['gbp', 'pd'],
    replace: '£',
  },

  {
    triggers: ['eu', 'euro'],
    replace: '€',
  },

  {
    triggers: ['ruble'],
    replace: '₽',
  },

  {
    triggers: ['yen'],
    replace: '¥',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
