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

  // (Partially) ordered set operations
  // https://en.wikipedia.org/wiki/Ordered_set_operators
  // Used in optimisation theory
  '≺': ['precedes', 'p<'],
  '≻': ['succeeds', 'p>'],
  '≼': ['precedeseq', 'p<='],
  '≽': ['succeedseq', 'p>='],

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
