local g = import '../../../lib/base.libsonnet';
local m = import '../../../lib/modifiers.libsonnet';

local L_PRE = g.PRE;
local L_POST = g.POST;

local S_PRE = ';';
local S_POST = '';

local rawMatches = [
{
      triggers: [
        L_PRE + 'alpha' + L_POST,
        S_PRE + 'a' + S_POST,
      ],
      replace: 'α',
    },
    {
      triggers: [
        L_PRE + 'beta' + L_POST,
        S_PRE + 'b' + S_POST,
      ],
      replace: 'β',
    },
    {
      triggers: [
        L_PRE + 'gamma' + L_POST,
        S_PRE + 'g' + S_POST,
      ],
      replace: 'γ',
    },
    {
      triggers: [
        L_PRE + 'delta' + L_POST,
        S_PRE + 'd' + S_POST,
      ],
      replace: 'δ',
    },
    {
      triggers: [
        L_PRE + 'epsilon' + L_POST,
        S_PRE + 'e' + S_POST,
      ],
      replace: 'ϵ',
    },
    {
      triggers: [
        L_PRE + 'zeta' + L_POST,
        S_PRE + 'z' + S_POST,
      ],
      replace: 'ζ',
    },
    {
      triggers: [
        L_PRE + 'eta' + L_POST,
        S_PRE + 'h' + S_POST,
      ],
      replace: 'η',
    },
    {
      triggers: [
        L_PRE + 'theta' + L_POST,
        S_PRE + 'q' + S_POST,
      ],
      replace: 'θ',
    },
    {
      triggers: [
        L_PRE + 'iota' + L_POST,
        S_PRE + 'i' + S_POST,
      ],
      replace: 'ι',
    },
    {
      triggers: [
        L_PRE + 'kappa' + L_POST,
        S_PRE + 'k' + S_POST,
      ],
      replace: 'κ',
    },
    {
      triggers: [
        L_PRE + 'lambda' + L_POST,
        S_PRE + 'l' + S_POST,
      ],
      replace: 'λ',
    },
    {
      triggers: [
        L_PRE + 'mu' + L_POST,
        S_PRE + 'm' + S_POST,
      ],
      replace: 'μ',
    },
    {
      triggers: [
        L_PRE + 'nu' + L_POST,
        S_PRE + 'n' + S_POST,
      ],
      replace: 'ν',
    },
    {
      triggers: [
        L_PRE + 'xi' + L_POST,
        S_PRE + 'c' + S_POST,
      ],
      replace: 'ξ',
    },
    {
      triggers: [
        L_PRE + 'omicron' + L_POST,
        S_PRE + 'o' + S_POST,
      ],
      replace: 'o',
    },
    {
      triggers: [
        L_PRE + 'pi' + L_POST,
        S_PRE + 'p' + S_POST,
      ],
      replace: 'π',
    },
    {
      triggers: [
        L_PRE + 'rho' + L_POST,
        S_PRE + 'r' + S_POST,
      ],
      replace: 'ρ',
    },
    {
      triggers: [
        L_PRE + 'sigma' + L_POST,
        S_PRE + 's' + S_POST,
      ],
      replace: 'σ',
    },
    {
      triggers: [
        L_PRE + 'tau' + L_POST,
        S_PRE + 't' + S_POST,
      ],
      replace: 'τ',
    },
    {
      triggers: [
        L_PRE + 'upsilon' + L_POST,
        S_PRE + 'u' + S_POST,
      ],
      replace: 'υ',
    },
    {
      triggers: [
        L_PRE + 'phi' + L_POST,
        S_PRE + 'f' + S_POST,
      ],
      replace: 'φ',
    },
    {
      triggers: [
        L_PRE + 'varphi' + L_POST,
        S_PRE + 'vf' + S_POST,
      ],
      replace: 'ϕ',
    },
    {
      triggers: [
        L_PRE + 'chi' + L_POST,
        S_PRE + 'x' + S_POST,
      ],
      replace: 'χ',
    },
    {
      triggers: [
        L_PRE + 'psi' + L_POST,
        S_PRE + 'y' + S_POST,
      ],
      replace: 'ψ',
    },
    {
      triggers: [
        L_PRE + 'omega' + L_POST,
        S_PRE + 'w' + S_POST,
      ],
      replace: 'ω',
    },
];

local matches = g.processExtras(rawMatches, {propagate_case: true});

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: matches
  }
)
