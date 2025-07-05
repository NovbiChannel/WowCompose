print("Text.lua loaded")

---@param text string
---@param modifier Modifier
---@param layer? Layer
---@param style? TextStyle
---@return table
_G.Text = function (text, modifier, layer, style)
    ---@param parent UIParent
    return function (parent)
        local fs = parent:CreateFontString(nil, layer or Layer.ARTWORK, style or TextStyle.NORMAL)
        fs:SetText(text)
        if modifier.anchor then fs:SetPoint(modifier.anchor.alignment) end

        return fs
    end
end