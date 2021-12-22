local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_GREEK_BOLD;
local POST = g.POST_GREEK_BOLD;

local STYLES = g.asciiStringToCaseTuple(
  [g.BOLD, g.BOLD_SHORT, g.BOLD_LONG]
);

local VS = g.VARIANT_SHORT;
local VSU = std.asciiUpper(VS);

local LOWER_START = '𝛂';
local UPPER_START = '𝚨';
local ADDITIONAL_START = '𝛛';

local ADDITIONAL_TRIGGERS = g.renderKeyOfTriggers(
  g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
  PRE[0],
  POST,
  PRE,
  POST,
) +
g.renderKeyOfTriggers(
  g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
  PRE[0],
  POST,
  g.renderArray(
    STYLES,
    g.PRE,
    ""),
  POST,
);


local lower = g.generateHitsFromUnicodeSequence(
  g.UNICODE_ORDERED_LATINISED_GREEK,
  LOWER_START
);
local upperRaw = g.generateHitsFromUnicodeSequence(
  g.asciiUpperArray(g.UNICODE_ORDERED_LATINISED_GREEK),
  UPPER_START
);

local upper = upperRaw[:17] +
              [
                {
                  replace: upperRaw[17].replace,
                  triggers: [VS + 'Q', VSU + 'Q'],
                },
              ]
              + upperRaw[18:];

// Bold Nabla covered elsewhere

local regular1 = lower + upper;
local regular2 = g.renderTriggers(
  regular1,
  PRE,
  POST,
);

local variants1 = g.generateHitsFromUnicodeSequence(
  g.UNICODE_ORDERED_LATINISED_ADDITIONAL_GREEK,
  ADDITIONAL_START,
);

local variants2 = g.renderTriggers(
  variants1,
  PRE,
  POST,
);

local rawHits1 = regular2 + variants2;

local rawHits2 = g.addAdditionalTriggersByTrigger(
  rawHits1,
  ADDITIONAL_TRIGGERS,
);

# Strip conflict with GBP from currency
local rawHits3 = g.stripTriggers(rawHits2,
  [
    g.PRE + "gbp" + g.POST,
  ] +
  g.renderArray(
    g.asciiStringToCaseTuple("beta"),
    g.PRE,
    g.POST,
  ),
);


g.renderDocument(
  std.thisFile,
  g.renderHits(rawHits3),
)
