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

  '❤': [
    'hj',
    'heart',
  ],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
