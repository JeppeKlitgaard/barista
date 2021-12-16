// Fix for Anki2
// Tested on Windows 10

std.manifestYamlDoc(
  {
    name: 'anki',
    filter_exec: 'anki.exe',
    backend: 'Clipboard',
  }
)
