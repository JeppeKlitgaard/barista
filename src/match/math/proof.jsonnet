local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∎': ['qed', 'halmos', 'tomb', 'tombstone'],
  '↯': ['contra', 'lightning', 'bolt'],
  '※': ['vcontra', '::x'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
