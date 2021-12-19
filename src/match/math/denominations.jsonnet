local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '‰': ['permille', '%0'],
  '‱': ['per10k', '%00'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
