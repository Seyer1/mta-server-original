addEventHandler("onResourceStart",resourceRoot,function(resource)
		if resource then
			outputDebugString(getResourceName(resource) .. ": los comandos se iniciaron correctamente.", 3)
			return true
		else
			outputDebugString(getResourceName(resource) .. ": no se ha podido iniciar los comandos.", 1)
			return false
		end
	end
)


local ip_port = "190.245.159.167:22003"	-- enter IP and port in format: 192.168.1.1:22003
local password = "ksa" -- If the server is passworded insert password here (if no password, it wont use the value)

function findPlayer(name) 
    local matches = {} 
    for i,v in ipairs(getElementsByType("player")) do 
        if getPlayerName(v) == name then 
            return v 
        end 
        local playerName = getPlayerName(v):gsub("#%x%x%x%x%x%x", "") 
        playerName = playerName:lower() 
        if playerName:find(name:lower(), 0) then 
            table.insert(matches, v) 
        end 
    end 
    if #matches == 1 then 
        return matches[1] 
    end 
    return false 
end 

addCommandHandler("send", 
    function(player, cmd, name, amount, target) 
        local amount = tonumber(amount) 
        if name and amount then 
            local target = findPlayer(name) 
            local money = getPlayerMoney(player)
			if player ~= target then
				if money >= amount then 
					if amount > 0 then
						takePlayerMoney(player, amount) 
						givePlayerMoney(target, amount) 
						outputChatBox("#009999[Info]#FFFFFF Le mandaste $"..amount.." a ".. getPlayerName(target).. ".", player, 0, 255, 0, true) 
						outputChatBox("#009999[Info]#FFFFFF "..getPlayerName(player).. " te envió $" ..amount.. ".", target, 0, 255, 0, true)
					end
				else 
					outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", player, 255, 255, 255, true)
				end
			else
				outputChatBox("#DD0606[Error]#FFFFFF Ingresa otro usuario.", player, 255, 255, 255, true)
			end
		else
			outputChatBox("Así bro: /send [nombre] [cantidad]", player, 255, 0, 0, false)
        end 
    end 
)

addCommandHandler("re", 
	function(thePlayer, cmd, name, target)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
			if name then
			local target = findPlayer(name)
				redirectPlayer(target, gettok(ip_port,1,":"), tonumber(gettok(ip_port,2,":")), password)
			else
				outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
			end
		end
	end
)

addCommandHandler("pos",
	function(thePlayer)
	local x,y,z = getElementPosition(thePlayer)
		outputChatBox("Tus coordenadas son: "..x..", "..y..", "..z, thePlayer)
	end
)

addCommandHandler("devmode",
    function(thePlayer)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
			setDevelopmentMode(true)
			outputChatBox("#009999[Info]#FFFFFF Devmode: ON",thePlayer, 0, 255, 0, true)
			
		end
    end
)

addCommandHandler("rel", 
	function(thePlayer, cmd, name, target)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
			if name then
			local target = findPlayer(name)
				if target then
				local u = getAccountName(getPlayerAccount(target))
				local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
				local checkS = check.Skin
				local s = getElementModel(target)
					if checkS ~= s then
						setElementModel(target, checkS)
						outputChatBox("#009999[Info]#FFFFFF Tu skin fue modificado del "..s.." al "..checkS..".", target, 255, 255, 255, true)
						outputDebugString("El skin cambió de "..s.."' a "..checkS.."'.", 0, 255, 255, 0)
						reA(thePlayer, cmd, name, target)
					else
						outputDebugString("Skin OK", 3)
						reA(thePlayer, cmd, name, target)
					end
				else
					outputChatBox("#DD0606[Error]#FFFFFF No se encontró el target.", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
			end
		end
	end
)

function reA(thePlayer, cmd, name, target)
	if name then
	local target = findPlayer(name)
		if target then
		local u = getAccountName(getPlayerAccount(target))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkA = check.Armor
		local a = getPedArmor(target)
			if checkA ~= a then
				setPedArmor(target, checkA)
				outputChatBox("#009999[Info]#FFFFFF Tu armor fue modificado de "..a.."% a "..checkA.."%.", target, 255, 255, 255, true)
				outputDebugString("El armor cambió de "..a.."% a "..checkA.."%.", 0, 255, 255, 0)
				reD(thePlayer, cmd, name, target)
			else
				outputDebugString("Armor OK", 3)
				reD(thePlayer, cmd, name, target)
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF No se encontró el target.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
	end
end

function reD(thePlayer, cmd, name, target)
	if name then
	local target = findPlayer(name)
		if target then
		local u = getAccountName(getPlayerAccount(target))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkD = check.Dinero
		local d = getPlayerMoney(target)
			if checkD ~= d then
				setPlayerMoney(target, checkD)
				outputChatBox("#009999[Info]#FFFFFF Tu dinero fue modificado de $"..d.." a $"..checkD..".", target, 255, 255, 255, true)
				outputDebugString("El dinero cambió de $"..d.." a $"..checkD..".", 0, 255, 255, 0)
				reV(thePlayer, cmd, name, target)
			else
				outputDebugString("Dinero OK", 3)
				reV(thePlayer, cmd, name, target)
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF No se encontró el target.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
	end
end

function reV(thePlayer, cmd, name, target)
	if name then
	local target = findPlayer(name)
		if target then
		local u = getAccountName(getPlayerAccount(target))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkV = check.Vida
		local v = getElementHealth(target)
			if checkV ~= v then
				setElementHealth(target, checkV)
				outputChatBox("#009999[Info]#FFFFFF Tu vida fue modificada de "..v.."% a "..checkV.."%.", target, 255, 255, 255, true)
				outputDebugString("La vida cambió de "..v.."% a "..checkV.."%.", 0, 255, 255, 0)
				reI(thePlayer, cmd, name, target)
			else
				outputDebugString("Vida OK", 3)
				reI(thePlayer, cmd, name, target)
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF No se encontró el target.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
	end
end

function reI(thePlayer, cmd, name, target)
	if name then
	local target = findPlayer(name)
		if target then
		local u = getAccountName(getPlayerAccount(target))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkInt = check.Interior
		local int = getElementInterior(target)
			if checkInt ~= int then
				setElementInterior(target, checkInt)
				outputChatBox("#009999[Info]#FFFFFF Tu interior fue modificado del número '"..int.."' al '"..checkInt.."'.", target, 255, 255, 255, true)
				outputDebugString("El interior cambió de "..int.." a "..checkInt..".", 0, 255, 255, 0)
				reDim(thePlayer, cmd, name, target)
			else
				outputDebugString("Int OK", 3)
				reDim(thePlayer, cmd, name, target)
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF No se encontró el target.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
	end
end

function reDim(thePlayer, cmd, name, target)
	if name then
	local target = findPlayer(name)
		if target then
		local u = getAccountName(getPlayerAccount(target))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkDim = check.Dimension
		local dim = getElementInterior(target)
			if checkDim ~= dim then
				setElementInterior(target, checkDim)
				outputChatBox("#009999[Info]#FFFFFF Tu dimensión fue modificado de la número '"..dim.."' a la '"..checkDim.."'.", target, 255, 255, 255, true)
				outputDebugString("La dimensión cambió de "..dim.." a "..checkDim..".", 0, 255, 255, 0)
			else
				outputDebugString("Dim OK", 3)
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF No se encontró el target.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF Ingresa un usuario.", thePlayer, 255, 255, 255, true)
	end
end
