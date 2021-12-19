local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Phone
  '07748966913': [
    'uktel',
  ],

  '+44 7748966913': [
    'uktel+',
  ],

  '22461358': [
    'dktel',
  ],

  '+45 22461358': [
    'dktel+',
  ],

  //## Email
  'jk782@cam.ac.uk': [
    '@cam',
  ],

  'jeppe@dapj.dk': [
    '@dapj',
  ],

  'jeppe.klitgaard@gmail.com': [
    '@gmail',
  ],

  'jeppe.klitgaard@nordic-sac.com': [
    '@nsac',
  ],

  'hi@jeppe.science': [
    '@',
    '@sci',
    '@science',
  ],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
