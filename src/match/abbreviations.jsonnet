local g = import '../lib/base.libsonnet';

local rawMatches = g.replacementTableToMatches({
  "TL;DR": "tldr",
});

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
