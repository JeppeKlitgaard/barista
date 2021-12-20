local g = import '../../../lib/base.libsonnet';

local S_PRE = g.PRE_SHORT_GREEK;
local S_POST = g.POST_SHORT_GREEK;

local L_PRE = g.PRE_LONG_GREEK;
local L_POST = g.POST_LONG_GREEK;

local SVAR_PRE = g.PRE_SHORT_VARIANT_GREEK;
local SVAR_POST = g.POST_SHORT_VARIANT_GREEK;

local LVAR_PRE = g.PRE_LONG_VARIANT_GREEK;
local LVAR_POST = g.POST_LONG_VARIANT_GREEK;

// Regular lower case hits
local regularLower1 = g.filterHitsByTriggers(
  g.generateHitsFromUnicodeSequence(
    g.UNICODE_ORDERED_LATINISED_GREEK,
    'α',
  ),
  ['vs'],
);


// Regular upper case hits
local regularUpper1 = g.filterHitsByTriggers(
  g.generateHitsFromUnicodeSequence(
    g.asciiUpperArray(g.UNICODE_ORDERED_LATINISED_GREEK),
    'Α',
  ),
  ['VS'],
);

local regular1 = regularLower1 + regularUpper1;
local regular2 = g.renderTriggers(
  regular1,
  S_PRE,
  S_POST,
);


local regular3 = g.addAdditionalTriggersByTrigger(
  regular2,
  g.renderKeyOfTriggers(
    g.UNICODE_LATINISED_ADDITIONAL_TRIGGERS_BY_TRIGGER,
    S_PRE,
    S_POST,
    L_PRE,
    L_POST,
  )
);

// Regular variant hits
local variants1 = g.replacementTableToHits({
  // Variant: Curly Beta
  'ϐ': [
    SVAR_PRE + 'b' + S_POST,
    L_PRE + 'curlybeta' + L_POST,
    LVAR_PRE + 'beta' + LVAR_POST,
  ],

  // Variant: Epsilon
  'ϵ': [
    SVAR_PRE + 'e' + S_POST,
    LVAR_PRE + 'epsilon' + LVAR_POST,
  ],

  // Variant: Script Theta
  'ϑ': [
    SVAR_PRE + 'q' + S_POST,
    L_PRE + 'scripttheta' + L_POST,
    LVAR_PRE + 'theta' + LVAR_POST,
  ],

  // Variant: Pi
  'ϖ': [
    SVAR_PRE + 'p' + S_POST,
    LVAR_PRE + 'pi' + LVAR_POST,
  ],

  // Variant: Phi
  'ϕ': [
    SVAR_PRE + 'f' + S_POST,
    LVAR_PRE + 'phi' + LVAR_POST,
  ],

  // Variant: Rho
  'ϱ': [
    SVAR_PRE + 'r' + S_POST,
    LVAR_PRE + 'rho' + LVAR_POST,
  ],

  // Variant: Sigma
  'ς': [
    SVAR_PRE + 's' + S_POST,
    LVAR_PRE + 'sigma' + LVAR_POST,
  ],

  // Variant: Upsilon
  'ϒ': [
    SVAR_PRE + 'u' + S_POST,
    LVAR_PRE + 'upsilon' + LVAR_POST,
  ],
});

local all = regular3 + variants1;


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.renderHits(all),
}
