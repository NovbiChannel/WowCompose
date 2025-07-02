print("Box.lua loaded")

---@param modifier Modifier
---@param content function
_G.Box = function(modifier, content)
    return function (parent)
        local frame = CreateComponent(parent, modifier)
        content(frame)

        return frame
    end
end