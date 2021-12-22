local g = import 'src/lib/base.libsonnet';

local sequence = g.UNICODE_ORDERED_LATINISED_GREEK;
local newStartChar = 'Α';

local overrides = {};

local matches = g.generateHitsFromStartAndEndCharsFromSequence(
  sequence,
  newStartChar,
  overrides
);

matches
// [
//     g.UNICODE_ORDERED_LATINISED_GREEK_LOWER,
//     g.UNICODE_ORDERED_LATINISED_GREEK_UPPER,
// ]
