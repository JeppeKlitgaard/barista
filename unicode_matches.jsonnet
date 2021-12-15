local g = import 'src/lib/base.libsonnet';

local normalStartChar = 'a';
local normalEndChar = "z";
local newStartChar = "A";

local overrides = {};

local matches = g.generateUnicodeMatches(
    normalStartChar,
    normalEndChar,
    newStartChar,
    overrides
);

matches