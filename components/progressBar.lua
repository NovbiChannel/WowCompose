---@param modifier Modifier
ProgressBar = function (modifier)
    ---@param parent UIParent
    return function (parent)
        local frame = CreateComponent(parent, modifier, "StatusBar")
        return frame
    end
end