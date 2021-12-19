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


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
