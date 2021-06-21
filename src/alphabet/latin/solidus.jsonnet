local g = import '../../lib/base.libsonnet';
local m = import '../../lib/modifiers.libsonnet';

local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = '/' + g.POST;

local rawMatches = [
  ### Lower case
  {
    trigger: 'd',
    replace: 'đ',
  },
  {
    trigger: 'g',
    replace: 'ǥ',
  },
  {
    trigger: 'h',
    replace: 'ħ',
  },
  {
    trigger: 'l',
    replace: 'ł',
  },
  {
    trigger: 't',
    replace: 'ŧ',
  },
  {
    trigger: 'z',
    replace: 'ƶ',
  },

  ### Upper case
  {
    trigger: 'D',
    replace: 'Đ',
  },
  {
    trigger: 'G',
    replace: 'Ǥ',
  },
  {
    trigger: 'H',
    replace: 'Ħ',
  },
  {
    trigger: 'L',
    replace: 'Ł',
  },
  {
    trigger: 'T',
    replace: 'Ŧ',
  },
  {
    trigger: 'Z',
    replace: 'Ƶ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
