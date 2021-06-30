local FakeLagSwitch = menu.switch("Fake Lag", "Randomizer", false)
local FakeLagRandomSlider = menu.SliderInt("Fake Lag", "Randomizer amount", 5 , 0, 10)
local ESwitch = menu.switch("Anti-Aim","Legit AA", false)
local SafeMax = menu.Combo("Anti-Aim", "Legit AA", {"Safe", "Max", "Middle"}, 0, "Safe always works, Max is Risky but OP")
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
ESwtichcheat.RegisterCallback(LegitAA)