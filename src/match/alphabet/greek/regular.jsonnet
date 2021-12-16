local g = import '../../../lib/base.libsonnet';

local L_PRE = g.PRE;
local L_POST = g.POST;

local S_PRE = ';';
local S_POST = '';

local LVAR_PRE = L_PRE + 'var';
local SVAR_PRE = S_PRE + 'v';


local rawMatches = [
  // Variant: Curly Beta
  {
    triggers: [
      L_PRE + 'curly' + 'beta' + L_POST,
      LVAR_PRE + 'beta' + L_POST,
      SVAR_PRE + 'b' + S_POST,
    ],
    replace: 'ϐ',
  },
  {
    triggers: [
      L_PRE + 'epsilon' + L_POST,
      S_PRE + 'e' + S_POST,
    ],
    replace: 'ϵ',
  },
  // Variant: Epsilon
  {
    triggers: [
      LVAR_PRE + 'epsilon' + L_POST,
      SVAR_PRE + 'e' + S_POST,
    ],
    replace: 'ε',
  },
  // Variant: Script Theta
  {
    triggers: [
      L_PRE + 'script' + 'theta' + L_POST,
      LVAR_PRE + 'theta' + L_POST,
      SVAR_PRE + 'q' + S_POST,
    ],
    replace: 'ϑ',
  },
  // Variant: Pi
  {
    triggers: [
      LVAR_PRE + 'pi' + L_POST,
      SVAR_PRE + 'p' + S_POST,
    ],
    replace: 'ϖ',
  },
  // Variant: Rho
  {
    triggers: [
      LVAR_PRE + 'rho' + L_POST,
      SVAR_PRE + 'r' + S_POST,
    ],
    replace: 'ϱ',
  },
  // Variant: Sigma
  {
    triggers: [
      LVAR_PRE + 'sigma' + L_POST,
      SVAR_PRE + 's' + S_POST,
    ],
    replace: 'ς',
  },

  // Variant: Upsilon
  {
    triggers: [
      LVAR_PRE + 'upsilon' + L_POST,
      SVAR_PRE + 'u' + S_POST,
    ],
    replace: 'ϒ',
  },
  {
    triggers: [
      L_PRE + 'phi' + L_POST,
      S_PRE + 'f' + S_POST,
    ],
    replace: 'φ',
  },
  // Variant: Phi
  {
    triggers: [
      LVAR_PRE + 'phi' + L_POST,
      SVAR_PRE + 'f' + S_POST,
    ],
    replace: 'ϕ',
  },

];

local regularLower1 = g.filterHitsByTriggers(
  g.generateHitsFromUnicodeSequence(
    g.UNICODE_ORDERED_LATINISED_GREEK,
    'α',
  ),
  ['vs'],
);

local regularLower2 = g.renderTriggers(
  regularLower1,
  S_PRE,
  S_POST,
);

local newRegularLower = g.addAdditionalTriggersByTrigger(
  regularLower2,
  g.renderKeyOfTriggers(
    g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
    S_PRE,
    S_POST,
    L_PRE,
    L_POST,
  )
);

newRegularLower
// [
//   regularLower2,
//   g.renderKeyOfTriggers(
//     g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
//     S_PRE,
//     S_POST,
//     L_PRE,
//     L_POST,
//   ),
//   newRegularLower,
// ]

// local regularUpper = g.filterHitsByTriggers(
//   g.generateUnicodeHitsFromSequence(
//     g.asciiUpperArray(g.UNICODE_ORDERED_LATINISED_GREEK),
//     "Α",
//     {},
//     {},
//     g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
//     false
//   ),
//   ["VS"],
// );

// local matches = regularLower + regularUpper;
// local matches = regularLower;
// newRegularLower
// local matches = g.processExtras(rawMatches, {propagate_case: true});

// local matches = g.processExtras(rawMatches, { propagate_case: true });

// std.manifestYamlDoc(
//   {
//     name: g.processFilename(std.thisFile),
//     parent: g.PARENT,

//     matches: newRegularLower,
//   }
// )

// matches;



