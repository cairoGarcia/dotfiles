function dotcolor (theme, color)
    local color_table =
    {
        ["tohru_flame"] =
        {
            ["fg"] = "#CB4047",
            ["bg"] = "#010101",
        },
        ["default"] =
        {
            ["fg"] = "#129399",
            ["bg"] = "#010101",
        }
    }

    -- Nil checking 
    if (theme or color) == nil then
        print("Error on dotcolor! Setting color to: #000000")
        return "#000000"
    end

    local dotcolor = color_table[theme][color]

    return dotcolor
end
