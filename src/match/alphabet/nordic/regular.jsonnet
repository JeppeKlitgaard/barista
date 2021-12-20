local g = import '../../../lib/base.libsonnet';

local rawMatches = [
  {
    trigger: 'ae',
    replace: 'æ',
    propagate_case: true,
  },
  {
    trigger: 'o/',
    replace: 'ø',
    propagate_case: true,
  },
  {
    trigger: 'aa',
    replace: 'å',
    propagate_case: true,
  },
];


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawMatches, g.PRE, g.POST),
}
