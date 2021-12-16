local g = import '../../lib/base.libsonnet';

local rawMatches = g.replacementTableToHits({
  '∂': ['d', 'partial', 'part'],
  '𝛛': ['D', 'Partial', 'Part'],

  '∇': ['nabla', 'del', 'gra'],
  '𝛁': ['Nabla', 'Del', 'Gra'],

  '𝛁 ⋅': ['divergence', 'div'],
  '𝛁 ×': ['curl'],

  '∇²': ['laplacian', 'lapl'],
  '𝛁²': ['Laplacian', 'Lapl'],
});

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
