local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  // lte/gte
  '≥': ['>=', 'geq'],
  '≤': ['<=', 'leq'],

  '≱': ['!>=', '!geq'],
  '≰': ['!<=', '!leq'],

  // gg, ll
  '≫': ['>>', 'gg'],
  '≪': ['<<', 'll'],

  // ggg, lll
  '⋙': ['>>>', 'ggg'],
  '⋘': ['<<<', 'lll'],

  // Approximations
  '≳': ['>~', 'g~'],
  '≲': ['<~', 'l~'],

  '≵': ['!>~', '!g~'],
  '≴': ['!<~', '!l~'],

  // ltgt's
  '≶': ['<>', 'ltgt'],
  '≷': ['><', 'gtlt'],

  '≸': ['!<>', '!ltgt'],
  '≹': ['!><', '!gtlt'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
