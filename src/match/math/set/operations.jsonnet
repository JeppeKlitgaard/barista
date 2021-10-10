local g = import '../../../lib/base.libsonnet';

local rawMatches = [
  ### Membership
  {
    triggers: ['in'],
    replace: '∈',
  },
  {
    triggers: ['!in'],
    replace: '∉',
  },

  {
    triggers: ['contains', 'ni'],
    replace: '∋',
  },
  {
    triggers: ['!contains', '!ni'],
    replace: '∌',
  },

  ### Relation
  {
    triggers: ['subset', 'subs'],
    replace: '⊂',
  },
  {
    triggers: ['superset', 'supers', 'sups'],
    replace: '⊃',
  },
  {
    triggers: ['!subset', '!subs'],
    replace: '⊄',
  },
  {
    triggers: ['!superset', '!supers', '!sups'],
    replace: '⊅',
  },
  {
    triggers: ['subseteq', 'subseq', 'subs='],
    replace: '⊆',
  },
  {
    triggers: ['superseteq', 'superseq', 'supseq', 'sups='],
    replace: '⊇',
  },
  {
    triggers: ['!subseteq', '!subsneq', 'subs!=', '!subs='],
    replace: '⊈',
  },
  {
    triggers: ['!superseteq', '!superseq', '!supseq', '!sups=', 'sups!='],
    replace: '⊉',
  },

  ### Operations
  {
    triggers: ['union', 'U'],
    replace: '∪',
  },
  {
    triggers: ['intersection', 'inter', 'UI', '!U'],
    replace: '∩',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
