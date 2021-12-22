local g = import '../../../lib/base.libsonnet';

local rawMatches = [
  {
    trigger: 'ae',
    replace: 'æ',
    propagate_case: true,
  },
  {
    trigger: 'o/',
    replace: 'ø',
    propagate_case: true,
  },
  {
    trigger: 'aa',
    replace: 'å',
    propagate_case: true,
  },
];

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


g.renderDocument(
  std.thisFile,
  g.renderHits(rawHits4),
)
