local g = import '../../../lib/base.libsonnet';

local preTrigger = 'ASD';
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {};

local lower = g.generateHitsFromUnicodeSequence(g.UNICODE_ORDERED_LATINISED_GREEK, '𝛂', lowerOverrides);
local upperRaw = g.generateHitsFromUnicodeSequence(g.asciiUpperArray(g.UNICODE_ORDERED_LATINISED_GREEK), '𝚨', lowerOverrides);

local upper = upperRaw[:17] +
              [
                {
                  replace: upperRaw[17].replace,
                  matches: ['vQ', 'VQ'],
                },
              ]
              + upperRaw[18:];

// Bold Nabla covered elsewhere

local rawMatches = lower + upper;
local matches = g.processTriggers(rawMatches, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
