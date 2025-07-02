print("Alignment.lua loaded")

---@enum Alignment
Alignment = {
    TopStart = "TOPLEFT",
    TopEnd = "TOPRIGHT",
    BottomStart = "BOTTOMLEFT",
    BottomEnd = "BOTTOMRIGHT",
    Center = "CENTER",
    Top = "TOP",
    Start = "LEFT",
    End = "RIGHT",
    Bottom = "BOTTOM"
}

---@param alignment Alignment
---@param x? integer
---@param y? integer
Anchor = function(alignment, x, y)
    return {
        alignment = alignment,
        x = x or 0,
        y = y or 0
    }
end