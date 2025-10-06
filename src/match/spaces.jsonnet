local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Zero width space, used for word breaking
  '​': ['zws', 'zwsp', 'zerowidthspace'], // U+200B

  //## Breakable spaces in order of increasing size
  ' ': ['hhsp', 'hairspace'], // U+200A
  ' ': ['thinsp', 'thinspace'], // U+2009
  ' ': ['mmsp', 'mediummathspace'], // U+202F
  ' ': ['sp', 'space'], // U+0020
  ' ': ['ensp', 'enspace'], // U+2002
  ' ': ['emsp', 'quad', 'emspace'], // U+2003
  // ' ': ['enquad'], // U+2000  // These are canonically equivalent to the non-quad versions, use those
  // ' ': ['emquad', 'quad', 'emspace'], // U+2001  // These are canonically equivalent to the non-quad versions, use those

  //## Non-breakable spaces in order of increasing size
  ' ': ['nnbsp', 'thinnbsp', 'narrownobreakspace'], // U+202F
  ' ': ['nbsp', 'nobreakspace'], // U+00A0

  //## Helpers
  '  ': ['qquad'],
  '   ': ['qqquad'],
  '    ': ['qqqquad'],
});




g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
