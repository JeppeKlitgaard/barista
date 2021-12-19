local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE;
local POST = g.POST;

local rawHits = g.replacementTableToHits({
  //## Lower Case
  'ⅰ': 'r1',
  'ⅱ': 'r2',
  'ⅲ': 'r3',
  'ⅳ': 'r4',
  'ⅴ': 'r5',
  'ⅵ': 'r6',
  'ⅶ': 'r7',
  'ⅷ': 'r8',
  'ⅸ': 'r9',
  'ⅹ': 'r10',
  'ⅺ': 'r11',
  'ⅻ': 'r12',

  //## Upper Case
  'Ⅰ': 'R1',
  'Ⅱ': 'R2',
  'Ⅲ': 'R3',
  'Ⅳ': 'R4',
  'Ⅴ': 'R5',
  'Ⅵ': 'R6',
  'Ⅶ': 'R7',
  'Ⅷ': 'R8',
  'Ⅸ': 'R9',
  'Ⅹ': 'R10',
  'Ⅺ': 'R11',
  'Ⅻ': 'R12',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, PRE, POST),
  }
)
