local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∂': ['d', 'partial', 'part', 'diff', 'differential'],
  '𝛛': ['D', 'Partial', 'Part', 'Diff', 'Differential'],

  '∇': ['nabla', 'del', 'gra'],
  '𝛁': ['Nabla', 'Del', 'Gra'],

  '𝛁 ⋅': ['divergence', 'div'],
  '𝛁 ×': ['curl'],

  '∇²': ['laplacian', 'lapl'],
  '𝛁²': ['Laplacian', 'Lapl'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
