local playerLvl = {}
local lvlLabel = {}
local progressBar = {}

local expBar = Box(
    Modifier:new()
    :setPadding(0, 0, 0, 5)
    :setWidth(325)
    :setHeight(25)
    :setAnchor(Alignment.Bottom),
    function (parent)
        playerLvl = Text(
            tostring(UnitLevel("player")),
            Modifier:new():setAnchor(Alignment.Start),
            Layer.ARTWORK,
            TextStyle.NORMAL_LARGE
        )(parent)

        Text (
            "         Уровень",
            Modifier:new():setAnchor(Alignment.TopStart),
            Layer.ARTWORK,
            TextStyle.NORMAL
        )(parent)

        lvlLabel = Text(
            "0/0 0%",
            Modifier:new():setAnchor(Alignment.TopEnd),
            Layer.OVERLAY,
            TextStyle.NORMAL
        )(parent)

        progressBar = ProgressBar(
            Modifier:new()
                :setWidth(300)
                :setHeight(10)
                :setBackground(Textures.Tooltip, BorderSize.Small)
                :setAnchor(Alignment.BottomEnd)
        )(parent)

        progressBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        progressBar:SetStatusBarColor(0, 0.6, 1, 0.4)
        progressBar:SetMinMaxValues(0, 1)
    end
)(UIParent)

local function UpdateExperience()
    local currentXP = UnitXP("player")
    local maxXP = UnitXPMax("player")
    local percent = math.floor((currentXP / maxXP) * 100)

    progressBar:SetValue(currentXP / maxXP)
    playerLvl:SetText(tostring(UnitLevel("player")))
    lvlLabel:SetText(""..currentXP.."/"..maxXP.." "..percent.."%")

    local restedXP = GetXPExhaustion()
    if restedXP then
        progressBar:SetMinMaxValues(0, maxXP)
        progressBar:SetValue(math.min(currentXP + restedXP, maxXP))
    end
end

expBar:RegisterEvent("PLAYER_XP_UPDATE")
expBar:RegisterEvent("PLAYER_LEVEL_UP")
expBar:RegisterEvent("UPDATE_EXHAUSTION")
expBar:SetScript("OnEvent", UpdateExperience)

UpdateExperience()