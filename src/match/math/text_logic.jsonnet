local g = import '../../lib/base.libsonnet';

local rawMatches = [
  ### Iteration
  {
    triggers: ['forall', 'fa'],
    replace: '∀',
  },

  ### Existance
  {
    triggers: ['thereexists', 'exists', 'te'],
    replace: '∃',
  },
  {
    triggers: ['!thereexists', '!exists', '!te'],
    replace: '∄',
  },

  ### Dots
  {
    triggers: ['therefore', 'thus', 'tf', 't4', ':.'],
    replace: '∴',
  },
  {
    triggers: ['because', 'bc', '.:'],
    replace: '∵',
  },
  {
    triggers: ['ratio'],
    replace: '∶',
  },
  {
    triggers: ['proportion', 'prop', '::'],
    replace: '∷',
  },

  ### Intervals
  {
    triggers: ['between', 'btwn', ')('],
    replace: '≬',
  },

  ### Reading help
  {
    triggers: ['bourbaki', 'danger', 'bend'],
    replace: '☡',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
