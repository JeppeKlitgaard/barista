local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  // Real and imaginary parts of
  'ℜ': ['Re', 're'],
  'ℑ': ['Im', 'im'],

  // Complex i symbol
  '𝑖': ['ci'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
