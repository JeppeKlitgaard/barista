# Fix for Visual Studio Code
# Tested on Windows 10

std.manifestYamlDoc(
    {
        name: "vscode",
        filter_exec: "Code.exe",
        backend: "Clipboard",
        backspace_delay: 12,
    }
)
