local g = import '../../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['ox'],
    replace: '⊗',
  },
  {
    triggers: ['o.'],
    replace: '⊙',
  },
  {
    triggers: ['oo'],
    replace: '⊚',
  },
  {
    triggers: ['o+'],
    replace: '⊕',
  },
  {
    triggers: ['o--'],
    replace: '⊖',
  },
  {
    triggers: ['o\\'],
    replace: '⊘',
  },
  {
    triggers: ['o*'],
    replace: '⊛',
  },
  {
    triggers: ['o='],
    replace: '⊜',
  },
  {
    triggers: ['o-'],
    replace: '⊝',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
