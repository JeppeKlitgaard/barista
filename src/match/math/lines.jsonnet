local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '⟂': ['perpendicular', 'perp', '_|_'],
  '∥': ['parallel', 'para', '||'],
  '‖': ['Parallel', 'Para', '||^'],
  '∦': ['!parallel', '!para', '|/|'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
