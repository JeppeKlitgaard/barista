local g = import '../../lib/base.libsonnet';

local pre_trigger = g.PRE + '^';
local post_trigger = g.POST;

local overrides = {
  '1': '¹',
  '2': '²',
  '3': '³',
};

local rawMatches = g.generateHitsFromStartAndEndChars('0', '9', '⁰', overrides);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
