local g = import 'base.libsonnet';

{
    processFilename(filename):
        local baseDir = std.thisFile;
        local split = std.split(filename, "/");

        // Find position of key
        local keyIdx = std.find(g.SRC_KEY, split)[0];

        local partsStart = keyIdx + 1;
        local partsEnd = std.length(split) - 1;

        // Strip .jsonnet from basename
        local basename = std.split(split[partsEnd], ".")[0];

        local parts = split[partsStart : partsEnd] + [basename];

        std.join("_", parts),


    generateUnicodeArray(startChar, num): [
        std.char(std.codepoint(startChar) + i)
        for i in std.range(0, num - 1)
    ],
}