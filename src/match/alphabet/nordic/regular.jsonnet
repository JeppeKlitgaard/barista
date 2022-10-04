local g = import '../../../lib/base.libsonnet';

// Define raw hits
local rawHits1 = g.replacementTableToHits({
  'æ': 'ae',
  'ø': 'o/',
  'å': 'aa',
});

// Render initial triggers
local rawHits2 = g.renderTriggers(rawHits1, g.PRE, g.POST);

// Add propagate_case property
local rawHits3 = g.addPropertiesToHits(
  rawHits2,
  { propagate_case: true },
);

// Add additional triggers
local rawHits4 = g.addAdditionalTriggersByReplacement(
  rawHits3,
  {
    'æ': ';;',
    'ø': ";'",
    'å': ';[',
  },
);

// Add special upper case triggers
local rawHitsAdditional1 = g.replacementTableToHits({
  'Æ': ';:',
  'Ø': ';"',
  'Å': ';{',
},
);

local rawHitsAdditional2 = g.renderTriggers(rawHitsAdditional1, '', '');

local allRawHits = rawHits4 + rawHitsAdditional2;


g.renderDocument(
  std.thisFile,
  g.renderHits(allRawHits),
)
