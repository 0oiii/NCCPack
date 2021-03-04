--[[
==============[ ███╗░░██╗░█████╗░░█████╗░██████╗░░█████╗░░█████╗░██╗░░██╗ ]==============|
==============[ ████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝ ]==============|
==============[ ██╔██╗██║██║░░╚═╝██║░░╚═╝██████╔╝███████║██║░░╚═╝█████═╝░ ]==============|
==============[ ██║╚████║██║░░██╗██║░░██╗██╔═══╝░██╔══██║██║░░██╗██╔═██╗░ ]==============|
==============[ ██║░╚███║╚█████╔╝╚█████╔╝██║░░░░░██║░░██║╚█████╔╝██║░╚██╗ ]==============|
==============[ ╚═╝░░╚══╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝ ]==============|
                 Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)
]]

-- Persona Name (Client)
local customnames = {}

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	TriggerServerEvent("getcustomnames")
end)

RegisterNetEvent("namechange")
AddEventHandler("namechange", function(names)

	customnames = names

end)

function GetCustomNames()
	return customnames
end

-- Twotter Handle
local customhandles = {}

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	TriggerServerEvent("getcustomhandles")
end)

RegisterNetEvent("handlechange")
AddEventHandler("handlechange", function(names)

	customhandles = handles

end)

function GetCustomHandles()
	return customhandles
end

-- Department
local customdept = {}

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	TriggerServerEvent("depthandles")
end)

RegisterNetEvent("deptchange")
AddEventHandler("deptchange", function(names)

	customa = depts

end)

function GetCustomA()
	return customa
end



	Citizen.CreateThread(function()

			TriggerEvent('chat:addSuggestion', '/department', '', {
				{ name="Select Department", help="SO, LS, HP, Civ, FD"}
			})

			TriggerEvent('chat:addSuggestion', '/twthandle', '', {
				{ name="Twotter Handle", help=""}
			})

			TriggerEvent('chat:addSuggestion', '/name', '', {
				{ name="firstname lastname", help=""}
			})

			TriggerEvent('chat:addSuggestion', '/ooc', 'Out Of Character chat Message. (Proximity Chat)', {
				{ name="Message", help="Put your questions or help request."}
			})
			
			TriggerEvent('chat:addSuggestion', '/gooc', 'Out Of Character chat Message. (Global Chat)', {
				{ name="Message", help="Put your questions or help request."}
			})

			TriggerEvent('chat:addSuggestion', '/me', 'Send message in the third person. (Proximity Chat)', {
				{ name="Message", help="message."}
			})

			TriggerEvent('chat:addSuggestion', '/mer', 'Send message. (Proximity Chat)', {
				{ name="Message", help="message."}
			})

			TriggerEvent('chat:addSuggestion', '/twt', 'Send a Twotter in game. (Global Chat)', {
				{ name="Message", help="Twotter Message."}
			})

			TriggerEvent('chat:addSuggestion', '/dw', 'Send a anonymous message in game. (Global Chat)', {
				{ name="Message", help="Anonymous Message."}
			})

	end)

	--Standard Chat
	RegisterNetEvent('SendProximityMessage')
	AddEventHandler('SendProximityMessage', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "^r" .. name .. " (#"..id..")", {128, 128, 128}, "^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "^r" .. name .. " (#"..id..")", {128, 128, 128}, "^r " .. message)
	  end
	end)

	--/me Command
	RegisterNetEvent('SendProximityMessageMe')
	AddEventHandler('SendProximityMessageMe', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^3 > ^7 " .. name .." (#"..id.."): ".."^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^3 > ^7 " .. name .." (#"..id.."): ".."^r " .. message)
	  end
	end)

	--/mer Command
	RegisterNetEvent('SendProximityMessageMer')
	AddEventHandler('SendProximityMessageMer', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^3 > ^7 " .. name .." (#"..id.."): ".."^8^* " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^3 > ^7 " .. name .." (#"..id.."): ".."^8^* " .. message)
	  end
	end)

	--/ooc Command
	RegisterNetEvent('SendProximityMessagePOOC')
	AddEventHandler('SendProximityMessagePOOC', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {4, 134, 255}, "^*" ..name  .. "^r^0: " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {4, 134, 255}, "^*" ..name .. "^r^0: " .. message)
	  end
	end)

	--/oocr Command
	RegisterNetEvent('SendProximityMessagePOOCr')
	AddEventHandler('SendProximityMessagePOOCr', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {4, 134, 255}, "^*" ..name  .. "^r^0: ^8^*" .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {4, 134, 255}, "^*" ..name .. "^r^0: ^8^*" .. message)
	  end
	end)
