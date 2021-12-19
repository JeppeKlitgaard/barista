local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  'TL;DR': 'tldr',
});

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
