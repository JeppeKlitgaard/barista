local g = import 'lib/base.libsonnet';

local rawMatches = [
  # Single arrows
  {
    triggers: [
      'la',
      'leftarrow',
      '<--',
    ],
    replace: '←',
  },
  {
    triggers: [
      'las',
      'leftarrowstroke',
      '<-/-',
    ],
    replace: '↚',
  },

  {
    triggers: [
      'ra',
      'rightarrow',
      '-->',
    ],
    replace: '→',
  },
  {
    triggers: [
      'ras',
      'rightarrowstroke',
      '-/->',
    ],
    replace: '↛',
  },

  {
    triggers: [
      'lra',
      'leftrightarrow',
      '<-->',
    ],
    replace: '↔',
  },
  {
    triggers: [
      'lras',
      'leftrightarrowstroke',
      '<-/->',
    ],
    replace: '↮',
  },

  {
    triggers: [
      'ua',
      'uparrow',
      '--^',
    ],
    replace: '↑',
  },

  {
    triggers: [
      'da',
      'downarrow',
      '--v',
    ],
    replace: '↓',
  },

  {
    triggers: [
      'uda',
      'updownarrow',
      'v--^',
      '^--v',
    ],
    replace: '↕',
  },

  # Double arrows
  {
    triggers: [
      'La',
      'Leftarrow',
      '<==',
    ],
    replace: '⇐',
  },
  {
    triggers: [
      'Las',
      'Leftarrowstroke',
      '<=/=',
    ],
    replace: '⇍',
  },

  {
    triggers: [
      'Ra',
      'Rightarrow',
      '==>',
    ],
    replace: '⇒',
  },
  {
    triggers: [
      'Ras',
      'Rightarrowstroke',
      '=/=>',
    ],
    replace: '⇏',
  },

  {
    triggers: [
      'Lra',
      'Leftrightarrow',
      '<==>',
      '=',
    ],
    replace: '⇔',
  },
  {
    triggers: [
      'Lras',
      'Leftrightarrowstroke',
      '<=/=>',
    ],
    replace: '⇎',
  },

  {
    triggers: [
      'Ua',
      'Uparrow',
      '==^',
    ],
    replace: '⇑',
  },

  {
    triggers: [
      'Da',
      'Downarrow',
      '==v',
    ],
    replace: '⇓',
  },

  {
    triggers: [
      'Uda',
      'Updownarrow',
      'v==^',
    ],
    replace: '⇕',
  },

  # Long single arrows
  {
    triggers: [
      'la-',
      'longleftarrow',
      '<---'
    ],
    replace: '⟵',
  },
  {
    triggers: [
      'ra-',
      'longrightarrow',
      '--->'
    ],
    replace: '⟶',
  },
  {
    triggers: [
      'lra-',
      'longleftrightarrow',
      '<--->'
    ],
    replace: '⟷',
  },

  # Long double arrows
  {
    triggers: [
      'La-',
      'longLeftarrow',
      '<==='
    ],
    replace: '⟸',
  },
  {
    triggers: [
      'Ra-',
      'longRightarrow',
      '===>'
    ],
    replace: '⟹',
  },
  {
    triggers: [
      'Lra-',
      'longLeftrightarrow',
      '<===>',
      'iff'
    ],
    replace: '⟺',
  },

  # Harpoon arrows
  {
    triggers: [
      'Lh',
      'Leftharpoon',
    ],
    replace: '↼',
  },
  {
    triggers: [
      'lh',
      'leftharpoon',
    ],
    replace: '↽',
  },

  {
    triggers: [
      'Rh',
      'Rightharpoon',
    ],
    replace: '⇀',
  },
  {
    triggers: [
      'rh',
      'rightharpoon',
    ],
    replace: '⇁',
  },

  {
    triggers: [
      'Dh',
      'Downharpoon',
    ],
    replace: '⇃',
  },
  {
    triggers: [
      'dh',
      'downharpoon',
    ],
    replace: '⇂',
  },

  {
    triggers: [
      'Uh',
      'Upharpoon',
    ],
    replace: '↿',
  },
  {
    triggers: [
      'uh',
      'upharpoon',
    ],
    replace: '↾',
  },

  {
    triggers: [
      'lrh',
      'leftrightharpoon',
    ],
    replace: '⇋',
  },
  {
    triggers: [
      'rlh',
      'rightleftharpoon',
    ],
    replace: '⇌',
  },

  {
    triggers: [
      'udh',
      'updownharpoon',
    ],
    replace: '⥮',
  },
  {
    triggers: [
      'duh',
      'downupharpoon',
    ],
    replace: '⥯',
  },

  # Squiggle arrows
  {
    triggers: [
      'rightsquigglearrow',
      '~~>',
    ],
    replace: '⇝',
  },
  {
    triggers: [
      'leftsquigglearrow',
      '<~~',
    ],
    replace: '⇜',
  },

  {
    triggers: [
      'longrightsquigglearrow',
      '~~~>',
    ],
    replace: '⟿',
  },
  {
    triggers: [
      'longleftsquigglearrow',
      '<~~~',
    ],
    replace: '⬳',
  },

  {
    triggers: [
      'leftrightsquigglearrow',
      '<~~>',
    ],
    replace: '↭',
  },

  # Bar single arrows
  {
    triggers: [
      'barrightarrow',
      '|-->',
    ],
    replace: '↦',
  },
  {
    triggers: [
      'barleftarrow',
      '<--|',
    ],
    replace: '↤',
  },
  {
    triggers: [
      'baruparrow',
      '|--^',
    ],
    replace: '↥',
  },
  {
    triggers: [
      'bardownarrow',
      '|--v',
    ],
    replace: '↧',
  },
  {
    triggers: [
      'longbarrightarrow',
      '|--->',
    ],
    replace: '⟼',
  },
  {
    triggers: [
      'longbarleftarrow',
      '<---|',
    ],
    replace: '⟻',
  },

  # Bar double arrow
  {
    triggers: [
      'barRightarrow',
      '|==>',
    ],
    replace: '⤇',
  },
  {
    triggers: [
      'barLeftarrow',
      '<==|',
    ],
    replace: '⤆',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
