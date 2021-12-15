local g = import '../../../lib/base.libsonnet';

local preTrigger = g.PRE_FRAKTUR;
local postTrigger = g.POST;

local lowerOverrides = {};
local upperOverrides = {
    "C": "ℭ",
    "H": "ℌ",
    "I": "ℑ",
    "R": "ℜ",
    "Z": "ℨ",
};

local lower = g.generateUnicodeMatches("a", "z", "𝔞", lowerOverrides);
local upper = g.generateUnicodeMatches("A", "Z", "𝔄", upperOverrides);

local rawMatches = lower + upper;
local matches = g.processTriggers(rawMatches, preTrigger, postTrigger);

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches,
  }
)
