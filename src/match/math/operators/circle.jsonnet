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


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
