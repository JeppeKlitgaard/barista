local g = import '../../../lib/base.libsonnet';


local pre_trigger = g.PRE_DIACRITIC;
local post_trigger = "'" + g.POST;

local rawMatches = [
  ### Symbol
  {
    trigger: "'",
    replace: '´',
  },

  ### Lower case
  {
    trigger: 'a',
    replace: 'á',
  },
  {
    trigger: 'c',
    replace: 'ć',
  },
  {
    trigger: 'e',
    replace: 'é',
  },
  {
    trigger: 'g',
    replace: 'ǵ',
  },
  {
    trigger: 'i',
    replace: 'í',
  },
  {
    trigger: 'k',
    replace: 'ḱ',
  },
  {
    trigger: 'l',
    replace: 'ĺ',
  },
  {
    trigger: 'm',
    replace: 'ḿ',
  },
  {
    trigger: 'n',
    replace: 'ń',
  },
  {
    trigger: 'o',
    replace: 'ó',
  },
  {
    trigger: 'p',
    replace: 'ṕ',
  },
  {
    trigger: 'r',
    replace: 'ŕ',
  },
  {
    trigger: 's',
    replace: 'ś',
  },
  {
    trigger: 'u',
    replace: 'ú',
  },
  {
    trigger: 'w',
    replace: 'ẃ',
  },
  {
    trigger: 'y',
    replace: 'ý',
  },
  {
    trigger: 'z',
    replace: 'ź',
  },

  ### Upper case
  {
    trigger: 'A',
    replace: 'Á',
  },
  {
    trigger: 'C',
    replace: 'Ć',
  },
  {
    trigger: 'E',
    replace: 'É',
  },
  {
    trigger: 'G',
    replace: 'Ǵ',
  },
  {
    trigger: 'I',
    replace: 'Í',
  },
  {
    trigger: 'K',
    replace: 'Ḱ',
  },
  {
    trigger: 'L',
    replace: 'Ĺ',
  },
  {
    trigger: 'M',
    replace: 'Ḿ',
  },
  {
    trigger: 'N',
    replace: 'Ń',
  },
  {
    trigger: 'O',
    replace: 'Ó',
  },
  {
    trigger: 'P',
    replace: 'Ṕ',
  },
  {
    trigger: 'R',
    replace: 'Ŕ',
  },
  {
    trigger: 'S',
    replace: 'Ś',
  },
  {
    trigger: 'U',
    replace: 'Ú',
  },
  {
    trigger: 'W',
    replace: 'Ẃ',
  },
  {
    trigger: 'Y',
    replace: 'Ý',
  },
  {
    trigger: 'Z',
    replace: 'Ź',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, pre_trigger, post_trigger),
  }
)
