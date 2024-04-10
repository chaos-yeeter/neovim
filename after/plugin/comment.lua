local Utils = require('utils')

-- toggle comment with <leader>/
Utils.change_keymap('n', '<leader>/', 'gcc<Esc>')
Utils.change_keymap('v', '<leader>/', 'gcc<Esc>')
