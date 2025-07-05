print("Row.lua loaded")

---@param modifier Modifier
---@param content function
_G.Row = function(modifier, content)
    return function(parent)
        local frame = CreateComponent(parent, modifier)
        
        if content then
            content(frame)
            
            -- Function to update layout
            local function updateLayout()
                local prevChild = nil
                local totalWidth = 0
                local maxHeight = 0
                local spacing = modifier.padding.left or 0
                
                -- Reset all points first
                for i = 1, frame:GetNumChildren() do
                    local child = select(i, frame:GetChildren())
                    child:ClearAllPoints()
                end
                
                -- Position children and calculate dimensions
                for i = 1, frame:GetNumChildren() do
                    local child = select(i, frame:GetChildren())
                    if child:IsShown() then
                        if prevChild then
                            child:SetPoint("LEFT", prevChild, "RIGHT", spacing, 0)
                        else
                            child:SetPoint("LEFT", frame, "LEFT", modifier.padding.left or 0, 0)
                        end
                        
                        totalWidth = totalWidth + child:GetWidth() + (i > 1 and spacing or 0)
                        maxHeight = math.max(maxHeight, child:GetHeight())
                        
                        prevChild = child
                    end
                end
            end
            
            -- Initial layout
            updateLayout()
        end
        
        return frame
    end
end