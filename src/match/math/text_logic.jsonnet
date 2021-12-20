local g = import '../../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Iteration
  '∀': ['forall', 'fa'],

  //## Existance
  '∃': ['thereexists', 'exists', 'te', 'E'],
  '∄': ['!thereexists', '!exists', '!te', '!E'],

  //## Dots
  '∴': ['therefore', 'thus', 'tf', 't4', ':.'],
  '∵': ['because', 'bc', '.:'],
  '∶': ['ratio'],
  '∷': ['proportion', 'prop', '::'],

  //## Intervals
  '≬': ['between', 'btwn', ')('],

  //## Reading help
  '☡': ['bourbaki', 'danger', 'bend'],
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.processTriggers(rawHits, g.PRE, g.POST),
}
