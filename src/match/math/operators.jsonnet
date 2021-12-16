local g = import '../../lib/base.libsonnet';

local rawMatches = [
  {
    triggers: ['pm', '+-'],
    replace: '±',
  },
  {
    triggers: ['mp', '-+'],
    replace: '∓',
  },

  {
    triggers: ['propto', 'pt', 'o<'],
    replace: '∝',
  },

  {
    triggers: ['divides', 'divs', '|'],
    replace: '∣',
  },
  {
    triggers: ['!divides', '!divs', '!|'],
    replace: '∤',
  },

  //
  {
    triggers: ['cdot', '.'],
    replace: '⋅',
  },
  {
    triggers: ['Cdot', '*'],
    replace: '∙',
  },

  //
  {
    triggers: ['ring', 'o'],
    replace: '∘',
  },
  {
    triggers: ['Ring', 'O'],
    replace: '〇',
  },

  {
    triggers: ['star'],
    replace: '∗',
  },

  //
  {
    triggers: ['cross', 'multiplication', 'mult', 'x'],
    replace: '×',
  },
  {
    triggers: ['division', '%', '-:'],
    replace: '÷',
  },
  {
    triggers: ['divtimes', '%*', '*%'],
    replace: '⋇',
  },

  //
  {
    triggers: ['prod'],
    replace: '∏',
  },
  {
    triggers: ['coprod'],
    replace: '∐',
  },
  {
    triggers: ['sum'],
    replace: '∑',
  },

  //
  {
    triggers: ['dagger', 'dag', 'hermitian', 'herm', 'h'],
    replace: '†',
  },
  {
    triggers: ['ddagger', 'ddag'],
    replace: '‡',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
