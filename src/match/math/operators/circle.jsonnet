local g = import '../../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '⊗': ['ox'],
  '⊙': ['o.'],
  '⊚': ['oo'],
  '⊕': ['o+'],
  '⊖': ['o--'],
  '⊘': ['o\\'],
  '⊛': ['o*'],
  '⊜': ['o='],
  '⊝': ['o-'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
