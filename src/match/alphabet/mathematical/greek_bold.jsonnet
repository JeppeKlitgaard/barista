local g = import '../../../lib/base.libsonnet';

local PRE = g.PRE_GREEK_BOLD;
local POST = g.POST_GREEK_BOLD;

local VS = g.VARIANT_SHORT;
local VSU = std.asciiUpper(VS);

local lower = g.generateHitsFromUnicodeSequence(g.UNICODE_ORDERED_LATINISED_GREEK, '𝛂');
local upperRaw = g.generateHitsFromUnicodeSequence(g.asciiUpperArray(g.UNICODE_ORDERED_LATINISED_GREEK), '𝚨');

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
  '𝛜'
);

local variants2 = g.renderTriggers(
  variants1,
  PRE,
  POST,
);

local variants3 = g.addAdditionalTriggersByTrigger(
  variants2,
  g.renderKeyOfTriggers(
    g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
    PRE,
    POST,
    PRE,
    POST,
  ),
);

local rawHits = regular2 + variants3;


g.renderDocument(
  std.thisFile,
  g.renderHits(rawHits),
)
