local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  '±': ['pm', '+-'],
  '∓': ['mp', '-+'],

  '∝': ['propto', 'pt', 'o<'],

  '∣': ['divides', 'divs', '|'],
  '∤': ['!divides', '!divs', '!|'],

  //
  '⋅': ['cdot', '.'],
  '∙': ['Cdot', '*'],

  //
  '∘': ['ring', 'o'],
  '〇': ['Ring', 'O'],

  '∗': ['star'],

  //
  '×': ['cross', 'multiplication', 'mult', 'x'],
  '÷': ['division', '%', '-:'],
  '⋇': ['divtimes', '%*', '*%'],

  //
  '∏': ['prod'],
  '∐': ['coprod'],
  '∑': ['sum'],

  //
  '†': ['dagger', 'dag', 'hermitian', 'herm', 'h'],
  '‡': ['ddagger', 'ddag'],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
