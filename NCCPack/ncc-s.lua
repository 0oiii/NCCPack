--[[
==============[ ███╗░░██╗░█████╗░░█████╗░██████╗░░█████╗░░█████╗░██╗░░██╗ ]==============|
==============[ ████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝ ]==============|
==============[ ██╔██╗██║██║░░╚═╝██║░░╚═╝██████╔╝███████║██║░░╚═╝█████═╝░ ]==============|
==============[ ██║╚████║██║░░██╗██║░░██╗██╔═══╝░██╔══██║██║░░██╗██╔═██╗░ ]==============|
==============[ ██║░╚███║╚█████╔╝╚█████╔╝██║░░░░░██║░░██║╚█████╔╝██║░╚██╗ ]==============|
==============[ ╚═╝░░╚══╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝ ]==============|
                 Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)
]]

local customnames = {}
local customhandles = {}
local customdept = {}

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

RegisterCommand("name", function(source, args)

	if not args[2] then
		TriggerClientEvent('chatMessage', -1, "^*Error: Please enter a first and last name.")
		return
	end
		
	local serverID = source
	local fullname = args[1] .. ' ' .. args[2]
		
	TriggerClientEvent('chatMessage', -1, "^*Updated Name: "..fullname)
	customnames[serverID] = fullname
		
end, false)

    --/TWT Handle
RegisterCommand("twthandle", function(source, args)
	if not args[1] then
		TriggerClientEvent('chatMessage', -1, "^*Error: Please enter a valid Twotter username.")
		return
	end
			
	local serverID = source
	local fulltwhandle = args[1]
			
	TriggerClientEvent('chatMessage', -1, "^*Updated Twotter username: "..fulltwhandle)
	customhandles[serverID] = fulltwhandle
	TriggerClientEvent("handlechange", -1, customhandles)
end, false)

    --/Department Related
RegisterCommand("department", function(source, args)
	fulldept = ""
	if not args[1] then
		TriggerClientEvent('chatMessage', -1,"^*Error: Please enter a valid department.")
		return
	end
	fulldept = args[1]
	selectedJob = false

	if fulldept == "so" then
		fulldept = "[BCSO]"
		playersjob = "BCSO"
		selectedJob = true
	
	elseif fulldept == "pd" then
		fulldept = "[LSPD]"
		playersjob = "LSPD"
		selectedJob = true

	elseif fulldept == "hp" then
		fulldept = "[SAHP]"
		playersjob = "SAHP"
		selectedJob = true

	elseif fulldept == "civ" then
		fulldept = "[Civ]"
		playersjob = "Civ"
		selectedJob = true

	elseif fulldept == "fd" then
		fulldept = "[LSFD]"
		playersjob = "LSFD"
		selectedJob = true

	elseif fulldept == "SO" then
		fulldept = "[BCSO]"
		playersjob = "BCSO"
		selectedJob = true

	elseif fulldept == "PD" then
		fulldept = "[LSPD]"
		playersjob = "LSPD"

	elseif fulldept == "HP" then
		fulldept = "[SAHP]"
		playersjob = "SAHP"
		selectedJob = true

	elseif fulldept == "CIV" then
		fulldept = "[Civ]"
		playersjob = "Civ"
		selectedJob = true

	elseif fulldept == "Civ" then
		fulldept = "[Civ]"
		playersjob = "Civ"
		selectedJob = true

	elseif fulldept == "FD" then
		fulldept = "[LSFD]"
		playersjob = "LSFD"
		selectedJob = true
	else
		TriggerClientEvent('chatMessage', -1, "^*[Invalid Department] Please choose from the following: SO, PD, HP, Civ, FD.")
	end
	selectedJob = false

	local serverID = source
		
	if selectedJob == true then
		TriggerClientEvent('chatMessage', -1, "^*Your department has been updated to "..playersjob) --,{120, 117, 116})
	end
	customdept[serverID] = fulldept
	TriggerClientEvent("deptchange", -1, customdept)
end, false)



-- Colours used: --
-- OOC #4A77A9
-- TWT #5B9EBC

-------------------- Chat -----------------------

--Standard Chat
AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len("/")) ~= "/" then
		--local name = GetPlayerName(source)
		local name = customnames[source]
		local dept = customdept[source]
		local stockname = GetPlayerName(source)
		if dept and name then
			TriggerClientEvent("SendProximityMessage", -1, source, dept.. "‎‎ ‎"..name, message)
		elseif name then
			TriggerClientEvent("SendProximityMessage", -1, source, name, message)
		elseif dept then
			TriggerClientEvent("SendProximityMessage", -1, source, dept.. "‎‎ ‎"..stockname, message)
		else
			TriggerClientEvent("SendProximityMessage", -1, source, stockname, message)
		end		
	end
		CancelEvent()
	end)	

--/me Command
RegisterCommand('me', function(source, args, user)
	local name = customnames[source]
	local dept = customdept[source]
	local stockname = GetPlayerName(source)
    if dept and name then
  		TriggerClientEvent("SendProximityMessageMe", -1, source, dept.. "‎‎ ‎"..name, table.concat(args, " "))
  	elseif name then
		TriggerClientEvent("SendProximityMessageMe", -1, source, name, table.concat(args, " "))
	elseif dept then
		TriggerClientEvent("SendProximityMessageMe", -1, source, dept.. "‎‎ ‎"..stockname, table.concat(args, " "))
	else
 		TriggerClientEvent("SendProximityMessageMe", -1, source, GetPlayerName(source), table.concat(args, " "))
	end
end, false)

	--/mer Command
RegisterCommand('mer', function(source, args, user)
	local name = customnames[source]
	local dept = customdept[source]
	local stockname = GetPlayerName(source)
	if dept and name then
		TriggerClientEvent("SendProximityMessageMer", -1, source, dept.. "‎‎ ‎"..name, table.concat(args, " "))
	elseif name then
		TriggerClientEvent("SendProximityMessageMer", -1, source, name, table.concat(args, " "))
	elseif dept then
		TriggerClientEvent("SendProximityMessageMer", -1, source, dept.. "‎‎ ‎"..stockname, table.concat(args, " "))
    else
  		TriggerClientEvent("SendProximityMessageMer", -1, source, GetPlayerName(source), table.concat(args, " "))
    end
end, false)

--/ooc Command
RegisterCommand('ooc', function(source, args, user)
	local name = customnames[source]
	local dept = customdept[source]
	local stockname = GetPlayerName(source)
	if dept and name then
		TriggerClientEvent("SendProximityMessagePOOC", -1, source, dept.. "‎‎ ‎"..name, table.concat(args, " "))
	elseif name then
		TriggerClientEvent("SendProximityMessagePOOC", -1, source, name, table.concat(args, " "))
	elseif dept then
		TriggerClientEvent("SendProximityMessagePOOC", -1, source, dept.. "‎‎ ‎"..stockname, table.concat(args, " "))
    else
  		TriggerClientEvent("SendProximityMessagePOOC", -1, source, GetPlayerName(source), table.concat(args, " "))
    end
end, false)
	
--/oocr
RegisterCommand('oocr', function(source, args, user)
	local name = customnames[source]
	local dept = customdept[source]
	local stockname = GetPlayerName(source)
	if dept and name then
		TriggerClientEvent("SendProximityMessagePOOCr", -1, source, dept.. "‎‎ ‎"..name, table.concat(args, " "))
	elseif name then
		TriggerClientEvent("SendProximityMessagePOOCr", -1, source, name, table.concat(args, " "))
	elseif dept then
		TriggerClientEvent("SendProximityMessagePOOCr", -1, source, dept.. "‎‎ ‎"..stockname, table.concat(args, " "))
    else
  		TriggerClientEvent("SendProximityMessagePOOCr", -1, source, GetPlayerName(source), table.concat(args, " "))
    end
end, false)

	--/twt Command
RegisterCommand('twt', function(source, args, user)
	local name = customhandles[source]
	if name then
	TriggerClientEvent('chatMessage', -1, "^*[Twotter] @" .. name .. "^r", {4, 196, 255}, table.concat(args, " "))
	else
		TriggerClientEvent('chatMessage', -1, "^*Please create Twotter account \"/twthandle {username}\"")
	end
end, false)

--/gooc Command
RegisterCommand('gooc', function(source, args, user)
	local name = customnames[source]
	local dept = customdept[source]
	local stockname = GetPlayerName(source)
	if dept and name then
	TriggerClientEvent('chatMessage', -1, dept.. "‎‎ ‎"..name, {4, 134, 255}, table.concat(args, " "))
	elseif name then
		TriggerClientEvent('chatMessage', -1, name , {4, 134, 255}, table.concat(args, " "))
	elseif dept then
		TriggerClientEvent('chatMessage', -1, dept.. "‎‎ ‎"..stockname, {4, 134, 255}, table.concat(args, " "))
	else 
	TriggerClientEvent('chatMessage', -1, GetPlayerName(source), {4, 134, 255}, table.concat(args, " "))
	end
end, false)

--/dw Command
RegisterCommand('dw', function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "^8^*[^*Dark Web] @^*Anonymous^r", {0, 0, 0}, table.concat(args, " "))
end, false)

-------------------------------------------------------------------------------


if EnableChatCommand == true then

	--String Splitting																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
	function stringsplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
end

-------------------------------------------------------------------------------

print [[


███╗░░██╗░█████╗░░█████╗░██████╗░░█████╗░░█████╗░██╗░░██╗
████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝
██╔██╗██║██║░░╚═╝██║░░╚═╝██████╔╝███████║██║░░╚═╝█████═╝░
██║╚████║██║░░██╗██║░░██╗██╔═══╝░██╔══██║██║░░██╗██╔═██╗░
██║░╚███║╚█████╔╝╚█████╔╝██║░░░░░██║░░██║╚█████╔╝██║░╚██╗
╚═╝░░╚══╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝

Has been successfully started!
Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)
]]
