{
    PARENT: 'default',

    // --- Global ---
    PRE: ':',
    POST: ' ',

    FRAKTUR: 'fk',
    BOLD: 'b',
    BLACKBOARDBOLD: 'bb',

    PRE_DIACRITIC: ',',

    PRE_BOLD: self.PRE + self.BOLD,
    PRE_BBB: self.PRE + self.BLACKBOARDBOLD,

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

    // -- Greek blackboardbold --
    PRE_GREEK_BBB: self.PRE_BBB,
    POST_GREEK_BBB: self.POST_LONG_GREEK,
}