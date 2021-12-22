local g = import '../lib/base.libsonnet';

local dateFmt = '%F';  // ISO 8601 Date
// 2021-06-13

local datetimeFmt = '%Y-%m-%dT%H:%M:%S%:z';  // ISO 8601 Date
// 2021-06-13T16:55:38+01:00

local rawMatches = [
  {
    triggers: [
      'isod',
      'isodate',
    ],
    replace: '{{isodate}}',
    vars: [
      {
        name: 'isodate',
        type: 'date',
        params: {
          format: dateFmt,
        },
      },
    ],
  },

  {
    triggers: [
      'isodt',
      'isodatetime',
    ],
    replace: '{{isodatetime}}',
    vars: [
      {
        name: 'isodatetime',
        type: 'date',
        params: {
          format: datetimeFmt,
        },
      },
    ],
  },
];


g.renderDocument(
  std.thisFile,
  g.processTriggers(rawMatches, g.PRE, g.POST),
)
