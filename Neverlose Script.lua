local FakeLagSwitch = menu.Switch("Fake Lag", "Randomizer", false)
local FakeLagRandomMode = menu.Combo("Fake Lag", "Randomizer presets", {"Off", "Always on", "On enemy visible", "While enemy visible"}, 0, "Safe always works, Max is Risky but OP")
local ESwitch = menu.Switch("Anti-Aim","Legit AA", false)
local SafeMax = menu.Combo("Anti-Aim", "Legit AA", {"Safe", "Max", "Middle"}, 0, "Safe always works, Max is Risky but OP")
local Jitter = menu.Switch("Anti-Aim", "Jitter", false)
local JitterSlide = menu.SliderInt("Anti-Aim", "Jitter Angle", 0, -58 ,58)



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