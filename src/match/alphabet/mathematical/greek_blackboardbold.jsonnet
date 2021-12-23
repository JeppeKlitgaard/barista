local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_GREEK_BBB;
local POST = g.POST_GREEK_BBB;


local hits = g.replacementTableToHits({
  // Pi
  'ℼ': 'pi',
  'ℿ': [
    'Pi',
    'PI',
  ],

  // Gamma
  'ℽ': 'gamma',
  'ℾ': [
    'Gamma',
    'GAMMA',
  ],

  // Sigma
  '⅀': [
    'Sigma',
    'SIGMA',
  ],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(hits, PRE, POST),
)
