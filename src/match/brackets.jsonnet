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


g.renderDocument(
  std.thisFile,
  g.renderTriggersAndHits(rawHits, g.PRE, g.POST),
)
