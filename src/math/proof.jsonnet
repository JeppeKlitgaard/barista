local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['qed', 'halmos', 'tomb', 'tombstone'],
    replace: '∎',
  },
  {
    triggers: ['contra', 'lightning', 'bolt'],
    replace: '↯',
  },
  {
    triggers: ['vcontra', '::x'],
    replace: '※',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
