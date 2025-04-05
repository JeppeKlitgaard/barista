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

  '∗': ['asterisk', 'ast'],
  '⋆': ['star'],

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


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)