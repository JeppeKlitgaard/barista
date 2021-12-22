local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '¤': ['currency'],
  '¢': ['cent'],
  '£': ['gbp', 'pd'],
  '€': ['eu', 'euro'],
  '₽': ['ruble'],
  '¥': ['yen'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
