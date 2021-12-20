local g = import '../../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  // Hbar
  'ℏ': 'hbar',
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
}
