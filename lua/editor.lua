local Utils = require("utils")

-- enable relative line numbers
Utils.set("number", true)
Utils.set("relativenumber", true)

-- disable search result highlighting
Utils.set("hlsearch", false)

-- smart case while searching
Utils.set("ignorecase", true)
Utils.set("smartcase", true)

-- disable swap file
Utils.set("swapfile", false)

-- don't show current mode (already shown in status line)
Utils.set("showmode", false)

-- hide command
Utils.set("cmdheight", 0)

-- highligh current line
Utils.set("cursorline", true)

-- set tab to 4 spaces
Utils.set("shiftwidth", 4)
Utils.set("tabstop", 4)
Utils.set("expandtab", true)

-- disable mouse
Utils.set("mouse", "")

-- Enable sign column
Utils.set("signcolumn", "yes")
