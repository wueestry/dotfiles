return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        -- configure lualine with modified theme
        require("lualine").setup({
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
            options = {
                theme = "catppuccin",
            },
        })
    end,
}
