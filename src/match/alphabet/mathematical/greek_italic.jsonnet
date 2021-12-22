local g = import '../../../lib/base.libsonnet';

local PRE = 'ASD';
local POST = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromUnicodeSequence(
  g.UNICODE_ORDERED_LATINISED_GREEK,
  '𝛂',
  lowerOverrides,
);
local upperRaw = g.generateHitsFromUnicodeSequence(
  g.asciiUpperArray(g.UNICODE_ORDERED_LATINISED_GREEK),
  '𝚨',
  lowerOverrides,
);

local upper = upperRaw[:17] +
              [
                {
                  replace: upperRaw[17].replace,
                  triggers: ['vQ', 'VQ'],
                },
              ]
              + upperRaw[18:];

local rawHits = lower + upper;


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, PRE, POST),
)
