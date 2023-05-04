local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Dashes
  '—': [
    'emdash',
    'em',
    '--',
  ],
  '–': [
    'endash',
    'en',
    '-',
  ],

  //## Quotes
  '“': ['l"'],
  '”': ['r"'],

  //## Ellipsis
  '…': [
    'ellipsis',
    'ellip',
    '...',
    '3.',
  ],
  '⋮': [
    'vellipsis',
    'vellip',
    'v...',
    'v3.',
    '...|',
  ],
  '⋰': [
    '.../',
  ],
  '⋱': [
    '...\\',
  ],

  //## Ditto
  '〃': [
    'ditto',
    'sameasabove',
    'repeat',
  ],
  '––〃––': [
    'Ditto',
    'dittodk',
    'Sameasabove',
    'Repeat',
  ],

  //## Partitioners
  // Paragraphs
  '¶': [
    'pilcrow',
    'paragraph',
    'paraph',
    'q',
  ],
  '⁋': [
    'rpilcrow',
    'rparagraph',
    'rparaph',
    'p',
  ],

  // Section
  '§': [
    'section',
    'sect',
    's',
  ],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
