local g = import '../lib/base.libsonnet';


local rawHits = g.replacementTableToHits({
  // 〈〉
  '〈': '</',
  '〉': '/>',

  // 《》
  '《': '<+',
  '》': '>+',

  // «»
  '«': '<_',
  '»': '>_',

  // ⌈ ⌉ ⌊ ⌋
  '⌈': '|^',
  '⌉': '^|',
  '⌊': '|_',
  '⌋': '_|',

  // 『』
  '『': '<"',
  '』': '>"',

  // 【】
  '【': '("',
  '】': ')"',

  // 〔〕
  '〔': "('",
  '〕': ")'",

  // 〖〗
  '〖': '(I',
  '〗': ')I',
});


{
  name: g.processFilename(std.thisFile),
  parent: g.PARENT,

  matches: g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
}
