local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  // Single arrows
  '←': [
    'from',
    'la',
    'leftarrow',
    '<--',
  ],
  '↚': [
    'notfrom',
    '!from',
    'las',
    'leftarrowstroke',
    '<-/-',
  ],

  '→': [
    'to',
    'ra',
    'rightarrow',
    '-->',
  ],
  '↛': [
    'notto',
    '!to',
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
    'implies',
    'Ra',
    'Rightarrow',
    '==>',
  ],
  '⇏': [
    'notimplies',
    '!implies',
    'Ras',
    'Rightarrowstroke',
    '=/=>',
  ],

  '⇔': [
    'biimplication',
    'Lra',
    'Leftrightarrow',
    '<==>',
    'bi',
  ],
  '⇎': [
    'notbiimplication',
    '!biimplication',
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
    'mapsto',
    'barrightarrow',
    '|-->',
  ],
  '↤': [
    'mapsfrom',
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

  // Paired arrows
  '⇉': [
    'rightrightarrow',
    'rra',
    '2-->',
  ],
  '⇇': [
    'leftleftarrow',
    'lla',
    '2<--',
  ],
  '⇈': [
    'upuparrow',
    'uua',
    '2--^',
  ],
  '⇊': [
    'downdownarrow',
    'dda',
    '2--v',
  ],

  // Triple rightward arrow
  '⇶': [
    'rightrightrightarrow',
    'rrra',
    '3-->',
    'substitute',
    'substituteinto',
    'subinto',
  ],

});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
