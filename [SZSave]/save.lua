function save()
	for _,v in ipairs ( getElementsByType("player") ) do 
	local u = getAccountName(getPlayerAccount(v))
	local s = getElementModel(v)
	local d = getPlayerMoney(v)
	local a = getPedArmor(v)
	local vida = getElementHealth(v)
	local x,y,z = getElementPosition(v)
	local xr,yr,zr = getElementRotation(v)
	local int = getElementInterior(v)
	local dim = getElementDimension(v)
	local team = getTeamName(getPlayerTeam(v))
	local guns = { }
		for slot = 0, 12 do
			guns [ slot ] = 
				{ 
					gun = getPedWeapon ( v, slot ), 
					ammo = getPedTotalAmmo ( v, slot ) 
				} 
		end
		if team then
			team = team
		else
			team = "Desempleado"
		end
		exports.SZSQL:_Exec("UPDATE users SET Skin=?,Dinero=?,Armor=?,Vida=?,x=?,y=?,z=?,xr=?,yr=?,zr=?,Interior=?,Dimension=?,Team=?,Weapons=? WHERE Usuario = ?", s, d, a, vida, x, y, z, xr, yr, zr, int, dim, team, toJSON(guns), u)	
	end
end
addEventHandler("onPlayerQuit",root,save)
addEventHandler("onResourceStop",resourceRoot,save)

function l0ad()
	for _,v in ipairs(getElementsByType("player")) do
		if not isGuestAccount(getPlayerAccount(v)) then 
		local u = getAccountName(getPlayerAccount(v))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkS = check.Skin
		local checkD = check.Dinero
		local checkA = check.Armor
		local checkV = check.Vida
		local checkX = check.x
		local checkY = check.y
		local checkZ = check.z
		local checkXr = check.xr
		local checkYr = check.yr
		local checkZr = check.zr
		local checkInt = check.Interior
		local checkDim = check.Dimension
		local checkTeam = check.Team
		local team = getTeamFromName(checkTeam)
		local checkW = fromJSON(check.Weapons)
			setElementModel(v, checkS)
			setPlayerMoney(v, checkD)
			setPedArmor(v, checkA)
			setElementHealth(v, checkV)
			setElementPosition(v, checkX, checkY, checkZ)
			setElementRotation(v, checkXr, checkYr, checkZr)
			setElementInterior(v, checkInt)
			setElementDimension(v, checkDim)
			setPlayerTeam(v, team)
			if ( type ( checkW ) == "table" ) then 
				for _, weapon in pairs ( checkW ) do 
					if ( weapon.gun and weapon.ammo ) then 
						giveWeapon ( v, weapon.gun, weapon.ammo )
					end 
				end 
			end 
		end
	end
end
addEventHandler("onPlayerLogin", getRootElement(),l0ad)
addEventHandler("onResourceStart",resourceRoot,l0ad)

function wasted()
	for _,v in ipairs ( getElementsByType("player") ) do  
		if not isGuestAccount(getPlayerAccount(v)) then
		local u = getAccountName(getPlayerAccount(v))
		local s = getElementModel(v)
		local guns = { }
			for slot = 0, 12 do
				guns [ slot ] = 
				{ 
					gun = getPedWeapon ( v, slot ), 
					ammo = getPedTotalAmmo ( v, slot ) 
				} 
			end
		local stats = { }
			for stat = 69, 79 do
				stats [ stat ] =
				{
					statinfo = getPedStat(v, stat)
				}
			end	
			exports.SZSQL:_Exec("UPDATE users SET Skin=?,Weapons=? WHERE Usuario = ?", s, toJSON(guns), toJSON(stats), u)
		end
	end
end
addEventHandler("onPlayerWasted",getRootElement(),wasted)

function spawn()
	for _,v in ipairs ( getElementsByType("player") ) do  
		if not isGuestAccount(getPlayerAccount(v)) then
		local u = getAccountName(getPlayerAccount(v))
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
		local checkS = check.Skin
		local checkW = fromJSON(check.Weapons)
		local checkSt = fromJSON(check.Stats)
		setElementModel(v, checkS)
			if ( type ( checkW ) == "table" ) then 
				for _, weapon in pairs ( checkW ) do 
					if ( weapon.gun and weapon.ammo ) then 
						giveWeapon ( v, weapon.gun, weapon.ammo )
					end 
				end 
			end 
			if ( type ( checkSt ) == "table" ) then 
				for _, stats in pairs ( checkSt ) do 
					if ( stats ) then 
						setPedStat ( v, stats )
					end 
				end 
			end
		end
	end
end
addEventHandler("onPlayerSpawn",getRootElement(),spawn)