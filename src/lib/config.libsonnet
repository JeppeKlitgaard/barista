local utils = import 'utils.libsonnet';


{
    PARENT: 'default',

    // --- Global ---
    PRE: ':',
    POST: ' ',

    VARIANT_SHORT: 'v',
    VARIANT_LONG: 'var',

    SANS_SERIF: 'ss',
    SANS_SERIF_SHORT: self.SANS_SERIF,
    SANS_SERIF_LONG: 'SansSerif',

    SCRIPT: 'sc',
    SCRIPT_SHORT: self.SCRIPT,
    SCRIPT_LONG: 'script',

    ITALIC: 'it',
    ITALIC_SHORT: 'i',
    ITALIC_LONG: 'italic',

    BOLD: 'bo',
    BOLD_SHORT: 'b',
    BOLD_LONG: 'bold',

    MONO: 'mono',
    MONO_SHORT: 'm',
    MONO_LONG: self.MONO,

    BLACKBOARDBOLD: 'bbb',
    BLACKBOARDBOLD_SHORT: 'bb',
    BLACKBOARDBOLD_LONG: 'blackboardbold',

    FRAKTUR: 'fk',
    FRAKTUR_SHORT: self.FRAKTUR,
    FRAKTUR_LONG: 'fraktur',

    // Diacritics
    PRE_DIACRITIC: ',',
    POST_ACUTE: "'",
    POST_BREVE: '(',
    POST_CARON: '<',
    POST_CEDILLA: ',',
    POST_CIRCLE: '0',
    POST_CIRCUMFLEX: '>',
    POST_DIAERESIS: ':',
    POST_DOUBLE_ACUTE: '"',
    POST_GRAVE: '!',
    POST_MACRON: '-',
    POST_OGONEK: ';',
    POST_SOLIDUS: '/',
    POST_TILDE: '~',

    // --- Italic
    PRE_ITALIC: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.ITALIC, self.ITALIC_LONG],
    ]),
    POST_ITALIC: self.POST,

    // --- Bold
    PRE_BOLD: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.BOLD, self.BOLD_LONG],
    ]),
    POST_BOLD: self.POST,

    // --- Bold italic
    PRE_BOLD_ITALIC: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.BOLD_SHORT, self.BOLD_LONG],
        [self.ITALIC_SHORT, self.ITALIC_LONG],
    ]),
    POST_BOLD_ITALIC: self.POST,

    // --- Sans Serif
    PRE_SANS_SERIF: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.SANS_SERIF, self.SANS_SERIF_SHORT, self.SANS_SERIF_LONG],
    ]),
    POST_SANS_SERIF: self.POST,

    PRE_SANS_SERIF_BOLD: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.SANS_SERIF, self.SANS_SERIF_SHORT, self.SANS_SERIF_LONG],
        [self.BOLD_SHORT, self.BOLD_LONG],
    ]),
    POST_SANS_SERIF_BOLD: self.POST,

    PRE_SANS_SERIF_ITALIC: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.SANS_SERIF, self.SANS_SERIF_SHORT, self.SANS_SERIF_LONG],
        [self.ITALIC_SHORT, self.ITALIC_LONG],
    ]),
    POST_SANS_SERIF_ITALIC: self.POST,

    PRE_SANS_SERIF_BOLD_ITALIC: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.SANS_SERIF, self.SANS_SERIF_SHORT, self.SANS_SERIF_LONG],
        [self.BOLD_SHORT, self.BOLD_LONG],
        [self.ITALIC_SHORT, self.ITALIC_LONG],
    ]),
    POST_SANS_SERIF_BOLD_ITALIC: self.POST,

    // --- Script
    PRE_SCRIPT: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.SCRIPT, self.SCRIPT_SHORT, self.SCRIPT_LONG],
    ]),
    POST_SCRIPT: self.POST,

    PRE_SCRIPT_BOLD: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.SCRIPT, self.SCRIPT_SHORT, self.SCRIPT_LONG],
        [self.BOLD_SHORT, self.BOLD_LONG],
    ]),
    POST_SCRIPT_BOLD: self.POST,

    // --- Blackboard bold
    PRE_BBB: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.BLACKBOARDBOLD, self.BLACKBOARDBOLD_SHORT, self.BLACKBOARDBOLD_LONG],
    ]),
    POST_BBB: self.POST,

    // --- Fraktur
    PRE_FRAKTUR: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.FRAKTUR, self.FRAKTUR_SHORT, self.FRAKTUR_LONG],
    ]),
    POST_FRAKTUR: self.POST,

    PRE_FRAKTUR_BOLD: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.FRAKTUR, self.FRAKTUR_SHORT, self.FRAKTUR_LONG],
        [self.BOLD_SHORT, self.BOLD_LONG],
    ]),
    POST_FRAKTUR_BOLD: self.POST,

    // --- Mono
    PRE_MONO: utils.compositeStringArrayOuterProduct([
        self.PRE,
        [self.MONO, self.MONO_SHORT, self.MONO_LONG],
    ]),
    POST_MONO: self.POST,

    // --- Greek ---
    GREEK_INLINE_SHORT: 'g',
    GREEK_INLINE_LONG: 'greek',
    GREEK_INLINES: [self.GREEK_INLINE_SHORT, self.GREEK_INLINE_LONG],

    PRE_SHORT_GREEK: ';',
    POST_SHORT_GREEK: '',
    PRE_LONG_GREEK: self.PRE,
    POST_LONG_GREEK: self.POST,

    // -- Greek variant --
    PRE_SHORT_VARIANT_GREEK: self.PRE_SHORT_GREEK + self.VARIANT_SHORT,
    POST_SHORT_VARIANT_GREEK: self.POST_SHORT_GREEK,
    PRE_LONG_VARIANT_GREEK: self.PRE_LONG_GREEK + self.VARIANT_LONG,
    POST_LONG_VARIANT_GREEK: self.POST_LONG_GREEK,

    // -- Greek bold
    STYLES_GREEK_BOLD: [
        [self.BOLD, self.BOLD_SHORT, self.BOLD_LONG],
    ],
    PRE_GREEK_BOLD: utils.compositeStringArrayOuterProduct([
        self.PRE,
        self.GREEK_INLINES,
        [self.BOLD_SHORT, self.BOLD_LONG],
    ]),
    POST_GREEK_BOLD: self.POST,

    // -- Greek italic
    STYLES_GREEK_ITALIC: [
        [self.ITALIC, self.ITALIC_SHORT, self.ITALIC_LONG],
    ],
    PRE_GREEK_ITALIC: utils.compositeStringArrayOuterProduct([
        self.PRE,
        self.GREEK_INLINES,
        [self.ITALIC_SHORT, self.ITALIC_LONG],
    ]),
    POST_GREEK_ITALIC: self.POST,

    // -- Greek bold italic
    STYLES_GREEK_BOLD_ITALIC: [
        [self.BOLD, self.BOLD_SHORT, self.BOLD_LONG],
        [self.ITALIC, self.ITALIC_SHORT, self.ITALIC_LONG],
    ],
    PRE_GREEK_BOLD_ITALIC: utils.compositeStringArrayOuterProduct([
        self.PRE,
        self.GREEK_INLINES,
        [
            [self.BOLD_SHORT, self.BOLD_LONG],
            [self.ITALIC_SHORT, self.ITALIC_LONG],
        ],
    ]),
    POST_GREEK_BOLD_ITALIC: self.POST,

    // -- Greek sans serif bold
    STYLES_GREEK_SANS_SERIF_BOLD: [
        [self.SANS_SERIF, self.SANS_SERIF_SHORT, self.SANS_SERIF_LONG],
        [self.BOLD_SHORT, self.BOLD_LONG],
    ],
    PRE_GREEK_SANS_SERIF_BOLD: utils.compositeStringArrayOuterProduct(
        [
            self.PRE,
            self.GREEK_INLINES,
        ] + self.STYLES_GREEK_SANS_SERIF_BOLD
    ),
    POST_GREEK_SANS_SERIF_BOLD: self.POST,

    // -- Greek sans serif bold italic
    STYLES_GREEK_SANS_SERIF_BOLD_ITALIC: [
        [self.SANS_SERIF, self.SANS_SERIF_SHORT, self.SANS_SERIF_LONG],
        [self.BOLD_SHORT, self.BOLD_LONG],
        [self.ITALIC_SHORT, self.ITALIC_LONG],
    ],

    PRE_GREEK_SANS_SERIF_BOLD_ITALIC: utils.compositeStringArrayOuterProduct(
        [
            self.PRE,
            self.GREEK_INLINES,
        ] + self.STYLES_GREEK_SANS_SERIF_BOLD_ITALIC
    ),
    POST_GREEK_SANS_SERIF_BOLD_ITALIC: self.POST,

    // -- Greek blackboardbold --
    PRE_GREEK_BBB: self.PRE_BBB,
    POST_GREEK_BBB: self.POST_LONG_GREEK,
}
