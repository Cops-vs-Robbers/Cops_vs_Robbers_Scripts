-- This is a script made by FreakingHulk for the Intro GUI in Cops vs Robbers.

local gui = script.Parent.Parent -- The core gui
local frame = script.Parent -- The frame that all of this is parented to
local cops, prisoners, citizens = frame.Cops, frame.Prisoners, frame.Citizens -- These are each textbuttons
local player = game.Players.LocalPlayer -- The player in which this script is running.
repeat wait() until player.Character and player.Character:IsDescendantOf(game.Workspace) -- Make sure the character is loaded.
local char = player.Character -- Assign player.Character to char
local SetCoreFunctions = { "SendNotification", "ResetButtonCallback" }
local teams = {["Cops"] = game.Teams.Cops, ["Prisoners"] = game.Teams.Prisoners, ["Robbers"] = game.Teams.Robbers, ["Citizens"] = game.Teams.Citizens}

function setSendNotificationParams(title, text)
  return {Title = title, Text = text}
end

function teamMemberNumberCheck(team)
  local number = #team:GetPlayers()
  
  if number > 10 then
    return true
  else
    return false
  end
end

-- Events & Functions

cops.MouseButton1Click:Connect(function() -- Listen for when the player clicks the "Cops Team" button, AKA the variable cops
  if teamMemberNumberCheck(teams.Cops) then
    cops.Text = "Sorry, that team is full."
    wait(3)
    cops.Text = "Cops Team"
  else
    player.TeamColor = BrickColor.new("Navy blue")
    game.StarterGui:SetCore(SetCoreFunctions[1], setSendNotificationParams("Team Change", "You joined the Cops Team."))
    game.ReplicatedStorage.PlayerTeamAssigned:FireServer({["Team"] = "Cops"})
    
  end
end)



gui.Enabled = true
