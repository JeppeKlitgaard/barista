local g = import 'src/lib/base.libsonnet';
local m = import 'src/lib/modifiers.libsonnet';

local startChar = '²';
local sequenceLength = 10;

local sequence_ = g.generateUnicodeArray(startChar, sequenceLength);

{
    sequence: sequence_,
}