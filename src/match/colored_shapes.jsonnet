local g = import '../lib/base.libsonnet';

local rawHits = g.replacementTableToHits({
  //## Square
  '🟥': ['reds', 'redsq', 'redsquare'],
  '🟧': ['oranges', 'orangesq', 'orangesquare'],
  '🟨': ['yellows', 'yellowsq', 'yellowsquare'],
  '🟩': ['greens', 'greensq', 'greensquare'],
  '🟦': ['blues', 'bluesq', 'bluesquare'],
  '🟪': ['purples', 'purplesq', 'purplesquare'],
  '🟫': ['browns', 'brownsq', 'brownsquare'],
  '⬛': ['blacks', 'blacksq', 'blacksquare'],
  '⬜': ['whites', 'whitesq', 'whitesquare'],

  //## Circle
  '🔴': ['red', 'redc', 'redcirc', 'redcircle'],
  '🟠': ['orange', 'orangec', 'orangecirc', 'orangecircle'],
  '🟡': ['yellow', 'yellowc', 'yellowcirc', 'yellowcircle'],
  '🟢': ['green', 'greenc', 'greencirc', 'greencircle'],
  '🔵': ['blue', 'bluec', 'bluecirc', 'bluecircle'],
  '🟣': ['purple', 'purplec', 'purplecirc', 'purplecircle'],
  '🟤': ['brown', 'brownc', 'browncirc', 'browncircle'],
  '⚫': ['black', 'blackc', 'blackcirc', 'blackcircle'],
  '⚪': ['white', 'whitec', 'whitecirc', 'whitecircle'],

  //## Heart
  '❤️': ['redh', 'redheart'],
  '🧡': ['orangeh', 'orangeheart'],
  '💛': ['yellowh', 'yellowheart'],
  '💚': ['greenh', 'greenheart'],
  '💙': ['blueh', 'blueheart'],
  '💜': ['purpleh', 'purpleheart'],
  '🤎': ['brownh', 'brownheart'],
  '🖤': ['blackh', 'blackheart'],
  '🤍': ['whiteh', 'whiteheart'],
});


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
