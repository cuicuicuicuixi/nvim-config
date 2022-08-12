local status_ok, db = pcall(require, "dashboard")
if not status_ok then
    return
end


db.custom_center = {
    {
        icon = '  ',
        desc = 'Recently files              ',
        action = 'Telescope oldfiles'
    },
    {
        icon = '  ',
        desc = 'Book marks                  ',
        action = 'Telescope marks',
    },
    {
        icon = '  ',
        desc = 'Find  File                  ',
        action = 'Telescope find_files',
    },
    -- {icon = '  ',
    -- desc ='File Browser                            ',
    -- action =  'Telescope file_browser',
    -- shortcut = 'SPC f b'},
    { icon = '  ',
        desc = 'Find  word                  ',
        action = 'Telescope live_grep',
    },
    { icon = '  ',
        desc = 'Find  projects              ',
        action = 'Telescope projects',
    },
    {
        icon = '  ',
        desc = 'config                      ',
        action = 'e ~/.config/nvim/init.lua',
    },
    {
        icon = '  ',
        desc = 'quit                        ',
        action = 'qa',
    }
}

db.default_executive = 'telescope'



db.custom_header = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],

    [[███████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗     ██╗    ██╗███████╗██╗███████╗███████╗███╗   ██╗ ██████╗ ]],
    [[╚══███╔╝██║  ██║██╔══██╗████╗  ██║██╔════╝     ██║    ██║██╔════╝██║██╔════╝██╔════╝████╗  ██║██╔════╝ ]],
    [[  ███╔╝ ███████║███████║██╔██╗ ██║██║  ███╗    ██║ █╗ ██║█████╗  ██║█████╗  █████╗  ██╔██╗ ██║██║  ███╗]],
    [[ ███╔╝  ██╔══██║██╔══██║██║╚██╗██║██║   ██║    ██║███╗██║██╔══╝  ██║██╔══╝  ██╔══╝  ██║╚██╗██║██║   ██║]],
    [[███████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝    ╚███╔███╔╝███████╗██║██║     ███████╗██║ ╚████║╚██████╔╝]],
    [[╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝      ╚══╝╚══╝ ╚══════╝╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ]],
    [[]], [[]],
    [[]], [[]],


}

db.custom_footer = { 'hello world' }
