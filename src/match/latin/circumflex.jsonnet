local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '>' + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: 'ˆ',
  },

  ### Lower case
  {
    trigger: 'a',
    replace: 'â',
  },
  {
    trigger: 'c',
    replace: 'ĉ',
  },
  {
    trigger: 'e',
    replace: 'ê',
  },
  {
    trigger: 'g',
    replace: 'ĝ',
  },
  {
    trigger: 'h',
    replace: 'ĥ',
  },
  {
    trigger: 'i',
    replace: 'î',
  },
  {
    trigger: 'j',
    replace: 'ĵ',
  },
  {
    trigger: 'o',
    replace: 'ô',
  },
  {
    trigger: 's',
    replace: 'ŝ',
  },
  {
    trigger: 'u',
    replace: 'û',
  },
  {
    trigger: 'w',
    replace: 'ŵ',
  },
  {
    trigger: 'y',
    replace: 'ŷ',
  },
  {
    trigger: 'z',
    replace: 'ẑ',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Â',
  },
  {
    trigger: 'C',
    replace: 'Ĉ',
  },
  {
    trigger: 'E',
    replace: 'Ê',
  },
  {
    trigger: 'G',
    replace: 'Ĝ',
  },
  {
    trigger: 'H',
    replace: 'Ĥ',
  },
  {
    trigger: 'I',
    replace: 'Î',
  },
  {
    trigger: 'J',
    replace: 'Ĵ',
  },
  {
    trigger: 'O',
    replace: 'Ô',
  },
  {
    trigger: 'S',
    replace: 'Ŝ',
  },
  {
    trigger: 'U',
    replace: 'Û',
  },
  {
    trigger: 'W',
    replace: 'Ŵ',
  },
  {
    trigger: 'Y',
    replace: 'Ŷ',
  },
  {
    trigger: 'Z',
    replace: 'Ẑ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
