{
    PARENT: 'default',

    // --- Global ---
    PRE: ':',
    POST: ' ',

    VARIANT_SHORT: 'v',
    VARIANT_LONG: 'var',

    FRAKTUR: 'fk',
    BOLD: 'b',
    BLACKBOARDBOLD: 'bb',


    PRE_BOLD: self.PRE + self.BOLD,
    PRE_BBB: self.PRE + self.BLACKBOARDBOLD,

    // Diacritics
    PRE_DIACRITIC: ',',
    POST_ACUTE: "'",
    // --- Fraktur

    PRE_FRAKTUR: self.PRE + self.FRAKTUR,
    POST_FRAKTUR: self.POST,

    PRE_FRAKTUR_BOLD: self.PRE_FRAKTUR + self.BOLD,
    POST_FRAKTUR_BOLD: self.POST,


    // --- Greek ---
    PRE_SHORT_GREEK: ';',
    POST_SHORT_GREEK: '',
    PRE_LONG_GREEK: self.PRE,
    POST_LONG_GREEK: self.POST,

    // -- Greek variant--
    PRE_SHORT_VARIANT_GREEK: self.PRE_SHORT_GREEK + self.VARIANT_SHORT,
    POST_SHORT_VARIANT_GREEK: self.POST_SHORT_GREEK,
    PRE_LONG_VARIANT_GREEK: self.PRE_LONG_GREEK + self.VARIANT_LONG,
    POST_LONG_VARIANT_GREEK: self.POST_LONG_GREEK,

    // -- Greek blackboardbold --
    PRE_GREEK_BBB: self.PRE_BBB,
    POST_GREEK_BBB: self.POST_LONG_GREEK,
}