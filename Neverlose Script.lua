local RotationJitter = 10
local FakeLagSwitch = menu.Switch("Fake Lag", "Randomizer", false)
local FakeLagRandomMode = menu.Combo("Fake Lag", "Randomizer presets", {"Off", "Always on", "On enemy visible", "While enemy visible"}, 0, "Safe always works, Max is Risky but OP")
local ESwitch = menu.Switch("Anti-Aim","Legit AA", false)
local SafeMax = menu.Combo("Anti-Aim", "Legit AA", {"Safe", "Max", "Middle"}, 0, "Safe always works, Max is Risky but OP")
local Jitter = menu.Switch("Anti-Aim", "Jitter", false)
local JitterAngle = menu.SliderInt("Anti-Aim", "Jitter Angle", 0, -58 ,58)
local TrashTalk = menu.Switch("Misc", "Trash Talk", false)
local Jitter1 = menu.Slider("Anti-Aim", "First Jitter", 0, -58, 58)
local Jitter2 = menu.Slider("Anti-Aim", "Second Jitter", 0, -58, 58)
local LBYJitter1 = menu.Slider("Anti-Aim", "First LBY Jitter", 0, -180, 180)
local LBYJitter2 = menu.Slider("Anti-Aim", "Second LBY Jitter", 0, -180, 180)

function JitterOffset()
    if (RotationJitter == 10) then
        antiaim.OverrideLBYOffset(Jitter1:GetValue())
        RotationJitter = 11
    elseif (RotationJitter == 11) then
        antiaim.OverrideLBYOffset(Jitter2:GetValue())
        RotationJitter = 10
        end
end

JitterOff.RegisterCallback(JitterOffset)

local Talk= {
    "Fire Burns",
    "Get sent to the Psych Ward",
    "Ez Media",
    "gAmsense CraCk",
    "Yato touches kids",
    "Jordan's a pedo",
    "Springs fakes media"
}
local TalkGrab=function()
    return Talk[math.random(1, #Talk):gsub('\"', '')]
end



local JitterFunc=function()
    local jitteron=jitter:GetBool()
    JitterSlide:SetVisible(jitteron)
    while Jitter == true
    do
        local RandNum = math.random(-10,10)
        antiaim.OverrideLBYOffset(JitterSlide - RandNum) 
    end
end

local FakeLag=function()
    local FakeLagSwtichONOFF = FakeLagSwitch:GetBool()
    FakeLagRandomSlider:SetVisible(FakeLagSwitchONOFF)

end

FakeLag()
FakeLagSwitch:RegisterCallback(FakeLag)

local LegitAA=function()
    private()
    local OnOFF = ESwitch:GetBool()
    if OnOFF == true then
        antiaim.OverridePitch(90) -- UP
        antiaim.OverrideInverter(true)
        antiaim.OverrideDesyncOnShot(4)
        antiaim.OverrideYawOffset(0)
        if SafeMax == Safe then
            antiaim.OverrideLBYOffset(29) -- safe
        if SafeMax == Max then
            antiaim.OverrideLBYOffset(58)
        else 
            antiaim.OverrideLBYOffset(35)
        end 
    end
end
LegitAA()
ESwtichcheat.RegisterCallback(LegitAA) end