local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_DOUBLE_ACUTE;


local rawHits = g.replacementTableToHits({
  //## Symbol
  '˝': "'",

  //## Lower case
  'ő': 'o',
  'ű': 'u',

  //## Upper case
  'Ő': 'O',
  'Ű': 'U',
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
