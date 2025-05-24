local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Phone
  '1234567890': [
    'tel',
  ],

  '+45 1234567890': [
    'tel+',
  ],

  //## Email
  'john.doe@gmail.com': [
    '@gmail',
  ],
});

local rawHitsNoPrePost = g.replacementTableToHits({
  'other.john.doe@gmail.com': [
    '@@',
  ],
});

local rendered_1 = g.renderTriggersAndHits(rawHits, g.PRE, g.POST);
local rendered_2 = g.renderTriggersAndHits(rawHitsNoPrePost, '', '');
local rendered = rendered_1 + rendered_2;

g.renderDocument(
  std.thisFile,
  rendered,
)
