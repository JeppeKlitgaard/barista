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


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
