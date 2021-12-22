local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_GREEK_BBB;
local POST = g.POST_GREEK_BBB;


local hits = g.replacementTableToHits({
  // Pi
  'ℼ': PRE + 'pi' + POST,
  'ℿ': [
    PRE + 'Pi' + POST,
    PRE + 'PI' + POST,
  ],

  // Gamma
  'ℽ': PRE + 'gamma' + POST,
  'ℾ': [
    PRE + 'Gamma' + POST,
    PRE + 'GAMMA' + POST,
  ],

  // Sigma
  '⅀': [
    PRE + 'Sigma' + POST,
    PRE + 'SIGMA' + POST,
  ],
});


g.renderDocument(
  std.thisFile,
  g.renderHits(hits),
)
