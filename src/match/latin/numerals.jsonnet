local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local pre_trigger = g.PRE;
local post_trigger = g.POST;

local rawMatches = [
  ### Lower Case
  {
    trigger: 'r1',
    replace: 'ⅰ',
  },
  {
    trigger: 'r2',
    replace: 'ⅱ',
  },
  {
    trigger: 'r3',
    replace: 'ⅲ',
  },
  {
    trigger: 'r4',
    replace: 'ⅳ',
  },
  {
    trigger: 'r5',
    replace: 'ⅴ',
  },
  {
    trigger: 'r6',
    replace: 'ⅵ',
  },
  {
    trigger: 'r7',
    replace: 'ⅶ',
  },
  {
    trigger: 'r8',
    replace: 'ⅷ',
  },
  {
    trigger: 'r9',
    replace: 'ⅸ',
  },
  {
    trigger: 'r10',
    replace: 'ⅹ',
  },
  {
    trigger: 'r11',
    replace: 'ⅺ',
  },
  {
    trigger: 'r12',
    replace: 'ⅻ',
  },

  ### Upper Case
  {
    trigger: 'R1',
    replace: 'Ⅰ',
  },
  {
    trigger: 'R2',
    replace: 'Ⅱ',
  },
  {
    trigger: 'R3',
    replace: 'Ⅲ',
  },
  {
    trigger: 'R4',
    replace: 'Ⅳ',
  },
  {
    trigger: 'R5',
    replace: 'Ⅴ',
  },
  {
    trigger: 'R6',
    replace: 'Ⅵ',
  },
  {
    trigger: 'R7',
    replace: 'Ⅶ',
  },
  {
    trigger: 'R8',
    replace: 'Ⅷ',
  },
  {
    trigger: 'R9',
    replace: 'Ⅸ',
  },
  {
    trigger: 'R10',
    replace: 'Ⅹ',
  },
  {
    trigger: 'R11',
    replace: 'Ⅺ',
  },
  {
    trigger: 'R12',
    replace: 'Ⅻ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
