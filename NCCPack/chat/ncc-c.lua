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
if EnableNameChange == true then
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
end

if EnableTwtCommands == true then
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
end

-- Department
if EnableDeptChange == true then
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

	function GetCustomDepts()
		return GetCustomDepts
	end
end



if EnableChatSuggestions == true then
	Citizen.CreateThread(function()
		if EnableDeptChange == true then
			TriggerEvent('chat:addSuggestion', '/department', '', {
				{ name="Select Department", help="SO, PD, HP, Civ, FD"}
			})
			TriggerEvent('chat:addSuggestion', '/cleardept', 'Clears your active department. (Client Sided)')
		end

		if EnableTwtCommands == true then
			TriggerEvent('chat:addSuggestion', '/twthandle', '', {
				{ name="Twotter Handle", help=""}
			})
			TriggerEvent('chat:addSuggestion', '/clearhandle', 'Clears your active twotter handle. (Client Sided)')
		end

		if EnableNameChange == true then
			TriggerEvent('chat:addSuggestion', '/name', '', {
				{ name="firstname lastname", help=""}
			})
			TriggerEvent('chat:addSuggestion', '/clearname', 'Clears your active name. (Client Sided)')
		end

		if EnableOOCChat == true then
			TriggerEvent('chat:addSuggestion', '/ooc', 'Out Of Character chat Message. (Proximity Chat)', {
				{ name="Message", help="Put your questions or help request."}
			})
		end
		
		if EnableOOCRChat == true then
			TriggerEvent('chat:addSuggestion', '/oocr', 'Out Of Character chat red Message. (Proximity Chat)', {
				{ name="Message", help="Put your questions or help request."}
			})
		end
			
		if EnableGOOCChat == true then
			TriggerEvent('chat:addSuggestion', '/gooc', 'Out Of Character chat Message. (Global Chat)', {
				{ name="Message", help="Put your questions or help request."}
			})
		end

		if EnableMeChat == true then
			TriggerEvent('chat:addSuggestion', '/me', 'Send message in the third person. (Proximity Chat)', {
				{ name="Message", help="message."}
			})
		end

		if EnableMerChat == true then
			TriggerEvent('chat:addSuggestion', '/mer', 'Send message. (Proximity Chat)', {
				{ name="Message", help="message."}
			})
		end
		
		if EnableTwtCommands == true then
			TriggerEvent('chat:addSuggestion', '/twt', 'Send a Twotter in game. (Global Chat)', {
				{ name="Message", help="Twotter Message."}
			})
		end

		if EnableDwChat == true then
			TriggerEvent('chat:addSuggestion', '/dw', 'Send a anonymous message in game. (Global Chat)', {
				{ name="Message", help="Anonymous Message."}
			})
		end

		if EnableClearCommand == true then
			TriggerEvent('chat:addSuggestion', '/clear', 'Clears all messages in your chat. (Client Sided)')
		end
	end)
end

if EnableStandChat == true then
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
end

if EnableMeChat == true then
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
end

if EnableMerChat == true then
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
end

if EnableOOCChat == true then
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
end

if EnableOOCRChat == true then
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
end

if EnableClearCommand == true then
	RegisterCommand('clear', function(source, args)
		TriggerEvent('chat:clear')
	end, false)
end