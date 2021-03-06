local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_CIRCLE;


local rawHits = g.replacementTableToHits({
  //## Symbol
  '˚': "'",

  //## Lower case
  'ů': 'u',
  'ẘ': 'w',
  'ẙ': 'y',

  //## Upper case
  'Ů': 'U',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
