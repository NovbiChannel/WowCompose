print("Component.lua loaded")

---@param parent UIParent
---@param modifier Modifier
---@param type? string
_G.CreateComponent = function(parent, modifier, type)
    local id = modifier.id
    local anchor = modifier.anchor
    local frame = CreateFrame(type or "Frame", id, parent)

    if Modifier.fillMaxWidth then
        frame:SetScript("OnSizeChanged", function ()
            frame:SetWidth(parent:GetWidth())
        end)
    end

    if Modifier.fillMaxHeight then
        frame:SetScript("OnSizeChanged", function ()
            frame:SetHeight(parent:GetHeight())
        end)
    end

    if modifier.width then frame:SetWidth(modifier.width) end
    if modifier.height then frame:SetHeight(modifier.height) end
    if modifier.background then frame:SetBackdrop(modifier.background) end
    if anchor then frame:SetPoint(anchor.alignment, anchor.x, anchor.y) end
    if modifier.movable then
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    end
    

    frame.wrapContent = modifier.wrapContent
    return frame
end