local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  // 2
  '½': ['half', '1/2'],

  // 3
  '⅓': ['third', '1/3'],
  '⅔': ['2/3'],

  // 4
  '¼': ['fourth', 'quarter', '1/4'],
  '¾': ['3/4'],

  // 5
  '⅕': ['fifth', '1/5'],
  '⅖': ['2/5'],
  '⅗': ['3/5'],
  '⅘': ['4/5'],

  // 6
  '⅙': ['sixth', '1/6'],
  '⅚': ['5/6'],

  // 7
  '⅐': ['seventh', '1/7'],

  // 8
  '⅛': ['eighth', '1/8'],
  '⅜': ['3/8'],
  '⅝': ['5/8'],
  '⅞': ['7/8'],

  // 9
  '⅑': ['ninth', '1/9'],

  // 10
  '⅒': ['tenth', '1/10'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
