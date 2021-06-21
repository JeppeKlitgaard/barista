local g = import '../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['d', 'partial', 'part'],
    replace: '∂',
  },

  {
    triggers: ['nabla', 'del', 'gra'],
    replace: '∇',
  },
  {
    triggers: ['Nabla', 'Del', 'Gra'],
    replace: '𝛁',
  },

  {
    triggers: ['divergence', 'div'],
    replace: '𝛁 ⋅',
  },

  {
    triggers: ['curl'],
    replace: '𝛁 ×',
  },

  {
    triggers: ['laplacian', 'lapl'],
    replace: '∇²',
  },
  {
    triggers: ['Laplacian', 'Lapl'],
    replace: '𝛁²',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
