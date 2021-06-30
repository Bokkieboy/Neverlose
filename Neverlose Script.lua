local FakeLagSwitch = menu.switch("Fake Lag", "Randomizer", false)
local FakeLagRandomSlider = menu.SliderInt("Fake Lag", "Randomizer amount", 5 , 0, 10)


local FakeLag=function()
    local FakeLagSwtichONOFF = FakeLagSwitch:GetBool()
    FakeLagRandomSlider:SetVisible(FakeLagSwitchONOFF)
end

FakeLag()
FakeLagSwitch:RegisterCallback(FakeLag)

