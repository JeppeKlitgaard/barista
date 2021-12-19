local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '⟂': ['perpendicular', 'perp', '_|_'],
  '∥': ['parallel', 'para', '||'],
  '‖': ['Parallel', 'Para', '||^'],
  '∦': ['!parallel', '!para', '|/|'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
