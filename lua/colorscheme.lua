colorscheme_entry = function(_color, _hl_groups)
    local result = {
	color = _color,
	hl_groups = _hl_groups,
    }
    return result
end

-- only foreground
apply_colorscheme_entries = function(colorscheme)
    for i, entry in ipairs(colorscheme) do
	for stuff, hl_group in ipairs(entry.hl_groups) do
	    vim.api.nvim_set_hl(0, hl_group, { fg = entry.color })
	end
    end
end
