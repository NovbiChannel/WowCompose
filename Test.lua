SLASH_COMPOSE1 = "/compose"

---@param text string
---@param parent UIParent
local function UiButton(text, parent)
    local btn = Button(
        text,
        Modifier:new()
            :fillMaxWidth(parent),
        nil,
        function()
            print("Click for "..text.." button")
        end
    )(parent)

    return btn
end

local ui = Box(
            Modifier:new()
                :setSize(200)
                :setBackground(Textures.DialogFrame, BorderSize.Large)
                :setMovable()
                :setAnchor(Alignment.Center),
            function(parent)
                Box(
                    Modifier:new()
                        :setWidth(100)
                        :setHeight(20)
                        :setBackground(Textures.DialogFrame, BorderSize.Medium)
                        :setAnchor(Alignment.Top),
                        function (_parent)
                            Text(
                                "Title",
                                Modifier:new():setAnchor(Alignment.Center),
                                nil,
                                TextStyle.TOOLTIP_TEXT
                            )(_parent)
                        end
                )(parent)

                Column(
                    Modifier:new()
                        :setPaddingHorizontal(24)
                        :setPaddingVertical(32)
                        :fillMaxSize(parent)
                        :setAnchor(Alignment.Center)
                    , 2 ,
                    function (_parent)
                        UiButton("Btn1", _parent)
                        UiButton("Btn2", _parent)
                        UiButton("Btn2", _parent)
                    end
                )(parent)
            end
        )(UIParent)

SlashCmdList["COMPOSE"] = function()
    if ui:IsShown() then
        ui:Hide()
    else
        ui:Show()
    end
end