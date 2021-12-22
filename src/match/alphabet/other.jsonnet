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


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
