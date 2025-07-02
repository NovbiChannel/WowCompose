print("Column.lua loaded")

---@param modifier Modifier
---@param content function
---@param contentSpacing integer
_G.Column = function(modifier, contentSpacing, content)
    return function(parent)
        local frame = CreateComponent(parent, modifier)
        
        if content then
            content(frame)
            
            -- Function to update layout
            local function updateLayout()
                local prevChild = nil
                local totalHeight = 0
                local maxWidth = 0
                
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
                            child:SetPoint("TOP", prevChild, "BOTTOM", 0, -contentSpacing)
                        else
                            child:SetPoint("TOP", frame, "TOP", 0, -contentSpacing)
                        end
                        
                        totalHeight = totalHeight + child:GetHeight() + (i > 1 and contentSpacing or 0)
                        maxWidth = math.max(maxWidth, child:GetWidth())
                        
                        prevChild = child
                    end
                end
            end
        
            updateLayout()
        end
        
        return frame
    end
end