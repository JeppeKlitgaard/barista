local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_BBB;
local POST = g.POST;

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '𝟬');

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, PRE, POST),
  }
)
