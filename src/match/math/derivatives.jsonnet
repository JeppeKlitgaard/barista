local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '∂': ['d', 'partial', 'part'],
  '𝛛': ['D', 'Partial', 'Part'],

  '∇': ['nabla', 'del', 'gra'],
  '𝛁': ['Nabla', 'Del', 'Gra'],

  '𝛁 ⋅': ['divergence', 'div'],
  '𝛁 ×': ['curl'],

  '∇²': ['laplacian', 'lapl'],
  '𝛁²': ['Laplacian', 'Lapl'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
