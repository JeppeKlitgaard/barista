local g = import '../../lib/base.libsonnet';

local PRE = g.PRE + '_';
local POST = g.POST;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '₀');

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, PRE, POST),
  }
)
