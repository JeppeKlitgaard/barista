local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_DIACRITIC;
local POST = g.POST_SOLIDUS;


local rawHits = g.replacementTableToHits({
  //## Lower case
  'đ': 'd',
  'ǥ': 'g',
  'ħ': 'h',
  'ł': 'l',
  'ŧ': 't',
  'ƶ': 'z',

  //## Upper case
  'Đ': 'D',
  'Ǥ': 'G',
  'Ħ': 'H',
  'Ł': 'L',
  'Ŧ': 'T',
  'Ƶ': 'Z',
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderTriggersAndHits(rawHits, PRE, POST),
  }
)
