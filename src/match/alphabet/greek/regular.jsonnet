local g = import '../../../lib/base.libsonnet';

local L_PRE = g.PRE;
local L_POST = g.POST;

local S_PRE = ';';
local S_POST = '';

local LVAR_PRE = L_PRE + 'var';
local SVAR_PRE = S_PRE + 'v';

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
    LVAR_PRE + 'beta' + L_POST,
  ],

  // Variant: Epsilon
  'ϵ': [
    SVAR_PRE + 'e' + S_POST,
    LVAR_PRE + 'epsilon' + L_POST,
  ],

  // Variant: Script Theta
  'ϑ': [
    SVAR_PRE + 'q' + S_POST,
    L_PRE + 'scripttheta' + L_POST,
    LVAR_PRE + 'theta' + L_POST,
  ],

  // Variant: Pi
  'ϖ': [
    SVAR_PRE + 'p' + S_POST,
    LVAR_PRE + 'pi' + L_POST,
  ],

  // Variant: Phi
  'ϕ': [
    SVAR_PRE + 'f' + S_POST,
    LVAR_PRE + 'phi' + L_POST,
  ],

  // Variant: Rho
  'ϱ': [
    SVAR_PRE + 'r' + S_POST,
    LVAR_PRE + 'rho' + L_POST,
  ],

  // Variant: Sigma
  'ς': [
    SVAR_PRE + 's' + S_POST,
    LVAR_PRE + 'sigma' + L_POST,
  ],

  // Variant: Upsilon
  'ϒ': [
    SVAR_PRE + 'u' + S_POST,
    LVAR_PRE + 'upsilon' + L_POST,
  ],
});

local all = regular3 + variants1;


std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.renderHits(all),
  }
)
