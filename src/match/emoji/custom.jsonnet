local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Yes/No/Maybe
  '✔': [
    'y',
    'yes',
  ],

  '❌': [
    'n',
    'no',
  ],

  '🟡': [
    'm',
    'maybe',
  ],
});


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
