local g = import '../lib/base.libsonnet';

local rawMatches = [
  ### Phone
  {
    triggers: [
      'uktel',
    ],
    replace: '07748966913',
  },
  {
    triggers: [
      'uktel+',
    ],
    replace: '+44 7748966913',
  },

  {
    triggers: [
      'dktel',
    ],
    replace: '22461358',
  },
  {
    triggers: [
      'dktel+',
    ],
    replace: '+45 22461358',
  },

  ### Email
  {
    triggers: [
      '@cam',
    ],
    replace: 'jk782@cam.ac.uk',
  },
  {
    triggers: [
      '@dapj',
    ],
    replace: 'jeppe@dapj.dk',
  },
  {
    triggers: [
      '@gmail',
    ],
    replace: 'jeppe.klitgaard@gmail.com',
  },
  {
    triggers: [
      '@nsac',
    ],
    replace: 'jeppe.klitgaard@nordic-sac.com',
  },
  {
    triggers: [
      '@',
      '@sci',
      '@science'
    ],
    replace: 'hi@jeppe.science',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
