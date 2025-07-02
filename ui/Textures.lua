print("Textures.lua loaded")

---@param background string
---@param border string
local TextureBundle = function(background, border)
    return {
        background = background,
        border = border
    }
end

Textures = {
    Tooltip = TextureBundle("Interface\\Tooltips\\UI-Tooltip-Background", "Interface\\Tooltips\\UI-Tooltip-Border"),
    DialogFrame = TextureBundle("Interface\\DialogFrame\\UI-DialogBox-Background", "Interface\\DialogFrame\\UI-DialogBox-Border")
}

---@param textureBundle table
---@param tile boolean
---@param tileSize integer
---@param borderSize integer
---@param padding table
BackDrop = function(textureBundle, tile, tileSize, borderSize, padding)
    return {
        bgFile = textureBundle.background,
        edgeFile = textureBundle.border,
        tile = tile,
        tileSize = tileSize,
        edgeSize = borderSize,
        insets = {
            left = padding.left,
            right = padding.right,
            top = padding.top,
            bottom = padding.bottom
        }
    }
end