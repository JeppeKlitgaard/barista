local g = import '../../lib/base.libsonnet';

local PRE = g.PRE + '^';
local POST = g.POST;

local overrides = {
  '1': '¹',
  '2': '²',
  '3': '³',
};

local rawHits = g.generateHitsFromStartAndEndChars('0', '9', '⁰', overrides);


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, PRE, POST),
}
