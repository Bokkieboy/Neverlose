local RotationJitter = 10
local FakeLagSwitch = menu.Switch("Fake Lag", "Randomizer", false)
local FakeLagRandomMode = menu.Combo("Fake Lag", "Randomizer presets", {"Off", "Always on", "On enemy visible", "While enemy visible"}, 0, "Safe always works, Max is Risky but OP")
local ESwitch = menu.Switch("Anti-Aim","Legit AA", false)
local SafeMax = menu.Combo("Anti-Aim", "Legit AA", {"Safe", "Max", "Middle"}, 0, "Safe always works, Max is Risky but OP")
local Jitter = menu.Switch("Anti-Aim", "Jitter", false)
local JitterAngle = menu.SliderInt("Anti-Aim", "Jitter Angle", 0, -58 ,58)
local TrashTalk = menu.Switch("Misc", "Trash phrases", false)
local JitterOff = menu.Switch("Anti-Aim","JitterOffset", false)
local Jitter1 = menu.Slider("Anti-Aim", "First Jitter", 0, -58, 58)
local Jitter2 = menu.Slider("Anti-Aim", "Second Jitter", 0, -58, 58)
local LBYJitter1 = menu.Slider("Anti-Aim", "First LBY Jitter", 0, -180, 180)
local LBYJitter2 = menu.Slider("Anti-Aim", "Second LBY Jitter", 0, -180, 180)
local WatermarkSwitch = menu.Switch("Misc", "Watermark", true)
local Resolver = menu.Switch("Rage Bot", "God resolver", false, "Click this to hit head all day everyday")
local ForceLethal = menu.Switch("Rage Bot", "Force Lethal on unarmoured", false, "Forces lethal if you have scout/revolver and they are one shot")

local forcelethalfunc=function()
    local forcelethalYN = ForceLethal:GetBool()
    if ragebot_shot.damage > 100 then
    ragebot.OverrideMinDamage(1, 101)
    ragebot.ForceSafety(1)
    end
end

local resolverfunc=function()
    local ResolverTN = Resolver:GetBool()
    ragebot.OverrideMinDamage(1, 101)
    ragebot.ForceSafety(1)
    ragebot.SetHitboxPriority(1, 0, 100)
    ragebot.OverrideHitchance(1, 80)
    ragebot.ForceHitboxSafety(1, 0)
    ragebot.EnableMultipoints(1, 0, true)
end

resolverfunc()
Resolver.RegisterCallback(resolverfunc)

local watermark=function()
    local username = cheat.GetCheatUserName()
    local text = "Bokkie Script | " .. username
    local textSize = g_Render:CalcTextSize(text, 12)
    local position = Vector2.new(25, 20)
    local indent = Vector2.new(15, 10)
    cheat.RegisterCallback("draw", function()
        g_Render:BoxFilled(Vector2.new(position.x - indent.x, position.y - indent.y), Vector2.new(position.x + textSize.x + indent.x, position.y + textSize.y + indent.y), Color.new(0, 0, 0, 0.7))
        g_Render:Text(text, Vector2.new(position.x, position.y), Color.new(1, 1, 1, 1), 12)
    end)
end

watermark()
WatermarkSwitch.RegisterCallback(watermark)

function JitterOffset()
    if (RotationJitter == 10) then
        antiaim.OverrideLBYOffset(Jitter1:GetValue())
        RotationJitter = 11
    elseif (RotationJitter == 11) then
        antiaim.OverrideLBYOffset(Jitter2:GetValue())
        RotationJitter = 10
    end
end

JitterOffset()
JitterOff.RegisterCallback(JitterOffset)

--Talk shit get ripped
local phrases= {
    "Fire Burns",
    "Get sent to the Psych Ward",
    "Ez Media",
    "gAmsense CraCk",
    "Yato touches kids",
    "Jordan's a pedo",
    "Springs fakes media"
}
local get_phrase=function()
    return phrases[math.random(1, #phrases):gsub('\"', '')]
end

local Trash=function()
    if TrashTalk:GetBool() == true then
        cheat.RegisterCallback("events", function(event)

            if event:GetName() ~= "player_death" then return end

            local me = g_EngineClient:GetLocalPlayer()
            local victim = g_EngineClient:GetPlayerForUserId(event:GetInt("userid"))
            local attacker = g_EngineClient:GetPlayerForUserId(event:GetInt("attacker"))

            if victim == attacker or attacker ~= me then return end

           g_EngineClient:ExecuteClientCmd('say "' .. get_phrase() .. '"')
        end)
    end
end


Trash()
TrashTalk:RegisterCallback(Trash)


local JitterFunc=function()
    local jitteron=jitter:GetBool()
    JitterSlide:SetVisible(jitteron)
    while Jitter == true
    do
        local RandNum = math.random(-10,10)
        antiaim.OverrideLBYOffset(JitterSlide - RandNum) 
    end
end

JitterFunc()
jitter:RegisterCallback(JitterFunc)

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
ESwtichcheat.RegisterCallback(LegitAA)end