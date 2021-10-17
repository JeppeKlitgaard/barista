local g = import '../../../lib/base.libsonnet';
local m = import '../../../lib/modifiers.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = ':' + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: '¨¨',
  },

  ### Lower case
  {
    trigger: 'a',
    replace: 'ä',
  },
  {
    trigger: 'e',
    replace: 'ë',
  },
  {
    trigger: 'h',
    replace: 'ḧ',
  },
  {
    trigger: 'i',
    replace: 'ï',
  },
  {
    trigger: 'o',
    replace: 'ö',
  },
  {
    trigger: 't',
    replace: 'ẗ',
  },
  {
    trigger: 'u',
    replace: 'ü',
  },
  {
    trigger: 'w',
    replace: 'ẅ',
  },
  {
    trigger: 'x',
    replace: 'ẍ',
  },
  {
    trigger: 'y',
    replace: 'ÿ',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Ä',
  },
  {
    trigger: 'E',
    replace: 'Ë',
  },
  {
    trigger: 'H',
    replace: 'Ḧ',
  },
  {
    trigger: 'I',
    replace: 'Ï',
  },
  {
    trigger: 'O',
    replace: 'Ö',
  },
  {
    trigger: 'U',
    replace: 'Ü',
  },
  {
    trigger: 'W',
    replace: 'Ẅ',
  },
  {
    trigger: 'X',
    replace: 'Ẍ',
  },
  {
    trigger: 'Y',
    replace: 'Ÿ',
  },


];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
