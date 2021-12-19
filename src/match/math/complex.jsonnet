local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  // Real and imaginary parts of
  'ℜ': ['Re', 're'],
  'ℑ': ['Im', 'im'],

  // Complex i symbol
  '𝑖': ['ci'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
