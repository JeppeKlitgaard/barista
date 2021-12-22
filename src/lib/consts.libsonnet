local config = import 'config.libsonnet';
local utils = import 'utils.libsonnet';

local VS = config.VARIANT_SHORT;
local VSU = std.asciiUpper(VS);

local VL = config.VARIANT_LONG;
local VLU = std.asciiUpper(VL);

local VARIANT_LONGS = utils.asciiStringToCaseTuple(VL);


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
        VS + "s",  // Annoying there is final sigma in the middle of our seq
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
        // Lower
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
        [VS + "s"]: VL + "sigma",  // Annoying there is final sigma in the middle of our seq
        "s": "sigma",
        "t": "tau",
        "u": "upsilon",
        "f": "phi",
        "x": "chi",
        "y": "psi",
        "w": "omega",

        // Upper
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

        // Variants
        "differential": ['partial', 'part', 'diff'],
        [VS + "e"]: VL + "epsilon",
        [VS + "q"]: VL + "theta",
        [VS + "k"]: VL + "kappa",
        [VS + "f"]: VL + "phi",
        [VS + "r"]: VL + "rho",
        [VS + "p"]:
            utils.stringArrayOuterProduct(
                VARIANT_LONGS,
                utils.asciiStringToCaseTuple("pi"),
            ),
    },

    // -------
    UNICODE_ORDERED_LATINISED_ADDITIONAL_GREEK: [
        "differential",
        VS + "e",
        VS + "q",
        VS + "k",
        VS + "f",
        VS + "r",
        VS + "p",
    ]
}