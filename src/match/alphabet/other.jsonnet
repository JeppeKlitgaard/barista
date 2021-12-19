local g = import '../../lib/base.libsonnet';


local PRE = g.PRE;
local POST = g.POST;

local rawHits = g.replacementTableToHits({
  'þ': 'th',
  'Þ': 'TH',

  'œ': 'oe',
  'Œ': 'OE',

  'ß': 'ss',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, PRE, POST),
  }
)
