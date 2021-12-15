local g = import '../../../lib/base.libsonnet';

local pre_trigger = g.PRE_BBB;
local post_trigger = g.POST;

local rawMatches = g.generateUnicodeMatches("0", "9", "𝟬");

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
