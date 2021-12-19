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


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawHits, g.PRE, g.POST),
  }
)
