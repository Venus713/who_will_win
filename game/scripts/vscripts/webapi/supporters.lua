Supporters = Supporters or {}
Supporters.playerState = Supporters.playerState or {}

function Supporters:GetLevel(playerId)
	return Supporters.playerState[playerId] and Supporters.playerState[playerId].level or 0
end

function Supporters:GetEndDate(playerId)
	return Supporters.playerState[playerId] and Supporters.playerState[playerId].endDate or ""
end

function Supporters:SetPlayerState(playerId, state)
	Supporters.playerState[playerId] = state
	CustomNetTables:SetTableValue("game", "player_supporter_" .. playerId, state)
	Econ:RefreshPlayerSupporterStatus(playerId)
end

local developerSteamIds = {
	["76561198132422587"] = true, -- Sanctus Animus
	["76561198054179075"] = true, -- darklord
	["76561198007141460"] = true, -- Firetoad
	["76561198064622537"] = true, -- Sheodar
	["76561198070058334"] = true, -- ark120202
	["76561198271575954"] = true, -- HappyFeedFriends
	["76561198188258659"] = true, -- Australia is my City
}

function Supporters:IsDeveloper(playerId, state)
	local steamId = tostring(PlayerResource:GetSteamID(playerId))
	return developerSteamIds[steamId] == true
end

local partySteamIds = {
	["76561198032344982"] = true, -- CuteFrog69
	["76561198071627284"] = true, -- Komapuk
	["76561199056725376"] = true, -- Husayn
	["76561198003571172"] = true, -- Baumi
	["76561198133364162"] = true, -- Blasphemy Incarnate
	["76561198040469212"] = true, -- Draze22
}

function Supporters:IsPartier(playerId, state)
	local steamId = tostring(PlayerResource:GetSteamID(playerId))
	return partySteamIds[steamId] == true
end
