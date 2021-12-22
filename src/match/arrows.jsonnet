local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  // Single arrows
  '←': [
    'la',
    'leftarrow',
    '<--',
  ],
  '↚': [
    'las',
    'leftarrowstroke',
    '<-/-',
  ],

  '→': [
    'ra',
    'rightarrow',
    '-->',
  ],
  '↛': [
    'ras',
    'rightarrowstroke',
    '-/->',
  ],

  '↔': [
    'lra',
    'leftrightarrow',
    '<-->',
  ],
  '↮': [
    'lras',
    'leftrightarrowstroke',
    '<-/->',
  ],

  '↑': [
    'ua',
    'uparrow',
    '--^',
  ],

  '↓': [
    'da',
    'downarrow',
    '--v',
  ],

  '↕': [
    'uda',
    'updownarrow',
    'v--^',
    '^--v',
  ],

  // Double arrows
  '⇐': [
    'La',
    'Leftarrow',
    '<==',
  ],
  '⇍': [
    'Las',
    'Leftarrowstroke',
    '<=/=',
  ],

  '⇒': [
    'Ra',
    'Rightarrow',
    '==>',
  ],
  '⇏': [
    'Ras',
    'Rightarrowstroke',
    '=/=>',
  ],

  '⇔': [
    'Lra',
    'Leftrightarrow',
    '<==>',
    '=',
  ],
  '⇎': [
    'Lras',
    'Leftrightarrowstroke',
    '<=/=>',
  ],

  '⇑': [
    'Ua',
    'Uparrow',
    '==^',
  ],

  '⇓': [
    'Da',
    'Downarrow',
    '==v',
  ],

  '⇕': [
    'Uda',
    'Updownarrow',
    'v==^',
  ],

  // Long single arrows
  '⟵': [
    'la-',
    'longleftarrow',
    '<---',
  ],
  '⟶': [
    'ra-',
    'longrightarrow',
    '--->',
  ],
  '⟷': [
    'lra-',
    'longleftrightarrow',
    '<--->',
  ],

  // Long double arrows
  '⟸': [
    'La-',
    'longLeftarrow',
    '<===',
  ],
  '⟹': [
    'Ra-',
    'longRightarrow',
    '===>',
  ],
  '⟺': [
    'Lra-',
    'longLeftrightarrow',
    '<===>',
    'iff',
  ],

  // Harpoon arrows
  '↼': [
    'Lh',
    'Leftharpoon',
  ],
  '↽': [
    'lh',
    'leftharpoon',
  ],

  '⇀': [
    'Rh',
    'Rightharpoon',
  ],
  '⇁': [
    'rh',
    'rightharpoon',
  ],

  '⇃': [
    'Dh',
    'Downharpoon',
  ],
  '⇂': [
    'dh',
    'downharpoon',
  ],

  '↿': [
    'Uh',
    'Upharpoon',
  ],
  '↾': [
    'uh',
    'upharpoon',
  ],

  '⇋': [
    'lrh',
    'leftrightharpoon',
  ],
  '⇌': [
    'rlh',
    'rightleftharpoon',
  ],

  '⥮': [
    'udh',
    'updownharpoon',
  ],
  '⥯': [
    'duh',
    'downupharpoon',
  ],

  // Squiggle arrows
  '⇝': [
    'rightsquigglearrow',
    '~~>',
  ],
  '⇜': [
    'leftsquigglearrow',
    '<~~',
  ],

  '⟿': [
    'longrightsquigglearrow',
    '~~~>',
  ],
  '⬳': [
    'longleftsquigglearrow',
    '<~~~',
  ],

  '↭': [
    'leftrightsquigglearrow',
    '<~~>',
  ],

  // Bar single arrows
  '↦': [
    'barrightarrow',
    '|-->',
  ],
  '↤': [
    'barleftarrow',
    '<--|',
  ],
  '↥': [
    'baruparrow',
    '|--^',
  ],
  '↧': [
    'bardownarrow',
    '|--v',
  ],
  '⟼': [
    'longbarrightarrow',
    '|--->',
  ],
  '⟻': [
    'longbarleftarrow',
    '<---|',
  ],

  // Bar double arrow
  '⤇': [
    'barRightarrow',
    '|==>',
  ],
  '⤆': [
    'barLeftarrow',
    '<==|',
  ],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
