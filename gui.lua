print("Loading!")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Transforming toy simulator GUI", "Serpent")
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main")
local amount = 0
local farm = false
local first = true
MainSection:NewButton("Unlock All", "unlocks all Robots", function()
    for i, v in ipairs(game:GetService("ReplicatedStorage").JJ:GetChildren()) do
        game:GetService("ReplicatedStorage").Remotes.BuyDragonEvent:FireServer(v.Name, -999)
        wait(0.1)
    end
end)
MainSection:NewSlider("Amount", "Choose the amount of money", 9999999, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    amount = s
end)
MainSection:NewButton("Give Money", "gives the amount of money chosen", function()
    game:GetService("ReplicatedStorage").Remotes.BuyDragonEvent:FireServer(game:GetService("Players").LocalPlayer.Character.DragonName.Value, amount - amount * 2)
end)
MainSection:NewToggle("AutoFarm", "Auto farm", function(state)
    farm = state
    if state == false then
        first = true
    end
end)
print("Loaded!")
while wait() do
    if farm then
        local root = game:GetService("Players").LocalPlayer.Character:findFirstChild("HumanoidRootPart")
        local part = Instance.new("Part")
        local platform = workspace:findFirstChild("BasePlatformSky")
        if first then
            if platform then
                root.CFrame = CFrame.new(0, 1306, 0)
            else
                part.Parent = workspace
                part.Size = Vector3.new(108,1,108)
                part.Position = Vector3.new(0, 1300, 0)
                part.Anchored = true
                part.Name = "BasePlatformSky"
                root.CFrame = CFrame.new(0, 1306, 0)
            end
        end
        for _,v in pairs(workspace["DX-02-CSD"]:GetDescendants()) do
            if v.Name == "Dian" and farm then
                v.CFrame = CFrame.new(0.020377218723297, 1300.4996337891, -8.099102973938)
            end
        end
    end
end
