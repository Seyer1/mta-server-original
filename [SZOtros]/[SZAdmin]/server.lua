function check(thePlayer)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
		triggerClientEvent(thePlayer, "[SZAdmin]:abrir", getRootElement())
	end
end
addEvent("[SZ]:checkStaff", true)
addEventHandler("[SZ]:checkStaff", getRootElement(), check)


function loadInfS(target)
	--for _, vehicle in ipairs(getElementsByType("vehicle")) do
		local name = getPlayerName(target)
		local acc = getAccountName(getPlayerAccount(target))
		local ip = getPlayerIP(target)
		local serial = getPlayerSerial(target)
		local hp = getElementHealth(target)
		local armor = getPedArmor(target)
		local dinero = getPlayerMoney(target)
		local skin = getElementModel(target)
		--local team = getTeamName(getPlayerTeam(target))
		local dim = getElementDimension(target)
		local int = getElementInterior(target)
		local car = getPedOccupiedVehicle(target)
		--local isVeh = isPedInVehicle(target)
		--local veh = getVehicleName(car)
		--local vehhp = getElementHealth(car)
		if armor == 0 then
			armor = "Nope"
		else
			armor = armor.."%"
		end
		if team then
			team = team
		else
			team = "Nope"
		end
		if dim == 0 then
			dim = "Normal"
		else
			dim = dim
		end
		if int == 0 then
			int = "Ninguno"
		else
			int = int
		end
		--if not car then
		--	vehhp = "N/A"
		--	veh = "Nope"
		--else
		--	veh = veh
		--	vehhp = vehhp
		--end
		--triggerClientEvent(getRootElement(), "[SZAdmin]:loadClient", getRootElement(), name, acc, ip, serial, hp, armor, dinero, skin, dim, int, isVeh, veh, vehhp)
		triggerClientEvent(getRootElement(), "[SZAdmin]:loadClient", getRootElement(), name, acc, ip, serial, hp, armor, dinero, skin, dim, int)
	--end
end
addEvent("[SZAdmin]:loadServer", true)
addEventHandler("[SZAdmin]:loadServer", getRootElement(), loadInfS)

	