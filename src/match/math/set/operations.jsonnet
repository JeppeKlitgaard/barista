local g = import '../../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Membership
  '∈': ['in'],
  '∉': ['!in'],

  '∋': ['contains', 'ni'],
  '∌': ['!contains', '!ni'],

  //## Relation
  '⊂': ['subset', 'subs'],
  '⊃': ['superset', 'supers', 'sups'],
  '⊄': ['!subset', '!subs'],
  '⊅': ['!superset', '!supers', '!sups'],
  '⊆': ['subseteq', 'subseq', 'subs='],
  '⊇': ['superseteq', 'superseq', 'supseq', 'sups='],
  '⊈': ['!subseteq', '!subsneq', 'subs!=', '!subs='],
  '⊉': ['!superseteq', '!superseq', '!supseq', '!sups=', 'sups!='],

  //## Operations
  '∪': ['union', 'U'],
  '∩': ['intersection', 'inter', 'UI', '!U'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
