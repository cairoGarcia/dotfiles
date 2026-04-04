    require('bufferline').setup({
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
            indicator = {
                style = "none",
            },
            buffer_close_icon = ' ',
            modified_icon = '*',
            close_icon = '',
            left_trunc_marker = '>',
            right_trunc_marker = '>',
        },
    })
