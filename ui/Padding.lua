---@param start integer
---@param top integer
---@param _end integer
---@param bottom integer
Padding = function(start, top, _end, bottom)
    return {
        left = start,
        top = top,
        right = _end,
        bottom = bottom
    }
end