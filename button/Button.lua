
---@param text string
---@param modifier Modifier
---@param template? ButtonTemplate
---@param OnClick function
Button = function (text, modifier, template, OnClick)
    ---@param parent UIParent
    return function (parent)
        local btn = CreateFrame("Button", nil, parent, template or ButtonTemplate.PanelButton)
        btn:SetText(text)

        if modifier.width then btn:SetWidth(modifier.width) end
        if modifier.height then btn:SetHeight(modifier.height) end

        if modifier.fillMaxWidth then
            btn:SetScript("OnSizeChanged", function ()
                btn:SetWidth(parent:GetWidth())
            end)
        end

        if modifier.fillMaxHeight then
            btn:SetScript("OnSizeChanged", function ()
                btn:SetHeight(parent:GetHeight())
            end)
        end

        if modifier.anchor then btn:SetPoint(modifier.anchor.alignment) end
        
        btn:SetScript("OnClick", OnClick)

        return btn
    end
end