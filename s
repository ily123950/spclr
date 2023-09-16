loadstring(game:HttpGet("https://pastebin.com/raw/jEDjp9Cw"))()

local folder = game:GetService("Workspace").Terrain["_Game"]:WaitForChild("Folder")
local defaultColor = Color3.new(1, 0, 0) -- Default color

local function setColor(part, color)
    colorAPI.color(part, color)
end

local function getRandomColor()
    return Color3.new(math.random(), math.random(), math.random())
end

local lastSize = 5.01

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local prefix = string.match(msg, "%S+")
    if prefix == ".spclr" then
        local num = string.match(msg, "%S+%s+(%S+)")
        
        if num and tonumber(num) >= 1 and tonumber(num) <= 30 then
            local targetColor = getRandomColor()
            local targetSize = 5.01 + (tonumber(num) - 1) * 0.01
            for _, part in pairs(folder:GetChildren()) do
                if part:IsA("BasePart") then
                    local partSize = part.Size
                    if partSize == Vector3.new(targetSize, 3, 1) then
                        setColor(part, targetColor)
                    end
                end
            end
        else
            warn("Usage: .spclr <num (1-30)>")
        end
    end
end)
