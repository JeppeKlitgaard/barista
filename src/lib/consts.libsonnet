
{
    //! Note: For some sequences upper case sequences the 18th element must
    // Be deleted after due to final sigma oddity
    // For other sequences the UNICODE_ORDERED_LATINISED_GREEK_UPPER is
    // The appropriate choice
    UNICODE_ORDERED_LATINISED_GREEK: [
        "a",
        "b",
        "g",
        "d",
        "e",
        "z",
        "h",
        "q",
        "i",
        "k",
        "l",
        "m",
        "n",
        "c",
        "o",
        "p",
        "r",
        "vs",  // Annoying there is final sigma in the middle of our seq
        "s",
        "t",
        "u",
        "f",
        "x",
        "y",
        "w",
    ],

    UNICODE_ORDERED_LATINISED_GREEK_UPPER:
        self.UNICODE_ORDERED_LATINISED_GREEK
        [:17]
        +
        self.UNICODE_ORDERED_LATINISED_GREEK
        [18:],

    UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER: {
        "a": "alpha",
        "b": "beta",
        "g": "gamma",
        "d": "delta",
        "e": "epsilon",
        "z": "zeta",
        "h": "eta",
        "q": "theta",
        "i": "iota",
        "k": "kappa",
        "l": "lambda",
        "m": "mu",
        "n": "nu",
        "c": "xi",
        "o": ["omikron", "omicron"],
        "p": "pi",
        "r": "rho",
        "vs": "varsigma",  // Annoying there is final sigma in the middle of our seq
        "s": "sigma",
        "t": "tau",
        "u": "upsilon",
        "f": "phi",
        "x": "chi",
        "y": "psi",
        "w": "omega",

        "A": ["Alpha", "ALPHA"],
        "B": ["Beta", "BETA"],
        "G": ["Gamma", "GAMMA"],
        "D": ["Delta", "DELTA"],
        "E": ["Epsilon", "EPSILON"],
        "Z": ["Zeta", "ZETA"],
        "H": ["Eta", "ETA"],
        "Q": ["Theta", "THETA"],
        "I": ["Iota", "IOTA"],
        "K": ["Kappa", "KAPPA"],
        "L": ["Lambda", "LAMBDA"],
        "M": ["Mu", "MU"],
        "N": ["Nu", "NU"],
        "C": ["Xi", "XI"],
        "O": ["Omikron", "Omicron", "OMIKRON", "OMICRON"],
        "P": ["Pi", "PI"],
        "R": ["Rho", "RHO"],
        "S": ["Sigma", "SIGMA"],
        "T": ["Tau", "TAU"],
        "U": ["Upsilon", "UPSILON"],
        "F": ["Phi", "PHI"],
        "X": ["Chi", "CHI"],
        "Y": ["Psi", "PSI"],
        "W": ["Omega", "OMEGA"],
    },
}