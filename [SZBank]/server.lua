addEventHandler("onResourceStart",resourceRoot,function(resource)
		if resource then
			outputDebugString(getResourceName(resource) .. ": el banco se inició correctamente.", 3)
			return true
		else
			outputDebugString(getResourceName(resource) .. ": no se ha podido iniciar el banco.", 1)
			return false
		end
	end
)

Principal = createMarker (246.43359375, 118.5908203125, 1002.21875, "cylinder", 1.5, 250, 250, 7, 120, getRootElement() )
setElementDimension(Principal, 1)  
setElementInterior(Principal, 10)

ConseguirTarjeta = createMarker(251.6865234375, 117.45703125, 1002.21875, "cylinder", 1.5, 250, 250, 7, 120, getRootElement() )
setElementDimension(ConseguirTarjeta, 1)  
setElementInterior(ConseguirTarjeta, 10)
-----------------------------------------------------------------------------------------		M		A		I		N		---------------------------------------------------------------------------------
function main(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
	if check then
	local checkNewDep = check.Depositado
		triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
	end
end
addEvent("[SZBank]:main", true)
addEventHandler("[SZBank]:main", getRootElement(), main)	

addEventHandler( "onMarkerHit", root,
	function(thePlayer)
		if getElementType(thePlayer) == "player" then
			if not isPedInVehicle(thePlayer) then
				if (source == Principal) then
				local u = getAccountName(getPlayerAccount(thePlayer))
				local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u)
				local checkNewDep = check.Depositado
					if not check then
						outputChatBox("#DD0606[Error]#FFFFFF No tenes tarjeta. Para conseguirla anda 'Permisos y licencias'.", thePlayer,255, 255, 255, true)
					else
						triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
						triggerClientEvent(thePlayer, "[SZBank]:abrir", getRootElement())
					end
				elseif (source == ConseguirTarjeta) then
				local u = getAccountName(getPlayerAccount(thePlayer))
				local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?", u)
					if not (check) then
						triggerClientEvent(thePlayer, "[SZBank]:conseguir", getRootElement())
					else
						outputChatBox("#DD0606[Error]#FFFFFF Ya tenes una tarjeta, no podes sacar otra.", thePlayer,255, 255, 255, true)
					end
				end
			end
		end
	end
)

function confirm(thePlayer)
local n = math.random(150887371, 444458214)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local checkN = exports.SZSQL:_QuerySingle("SELECT Numero FROM bank WHERE Numero = ?",n)
local money = getPlayerMoney(thePlayer)
	if money >= 50000 then
		if checkN ~= n then
			exports.SZSQL:_Exec("INSERT INTO bank(Numero,Usuario,Depositado) VALUES(?,?,?)",n,u,0)	
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Nope","[Compra] El jugador ["..getPlayerName(thePlayer).."] consiguió la tarjeta correctamente.")
			takePlayerMoney(thePlayer, 50000)
			outputChatBox("#009999[Info]#FFFFFF Conseguiste tu tarjeta correctamente.", thePlayer, 255, 255, 255, true)
			outputChatBox("#009999[Info]#FFFFFF Ahora anda a la ventanilla para hacer las operaciones!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer,255, 255, 255, true)
	end
end
addEvent("[SZBank]:confirm", true)
addEventHandler("[SZBank]:confirm", getRootElement(), confirm)

------------------------------------------------------------------------------		D		E		P		O		S		I		T		A		R	----------------------------------------------------------------------------
function depCinco(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + 5000
local money = getPlayerMoney(thePlayer) + 1
	if money >= 5000 then
		if checkDep + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, 5000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $5.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:depCinco", true)
addEventHandler("[SZBank]:depCinco", getRootElement(), depCinco)

function depDiez(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + 10000
local money = getPlayerMoney(thePlayer) + 1
	if money >= 10000 then
		if checkDep + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, 10000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $10.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:depDiez", true)
addEventHandler("[SZBank]:depDiez", getRootElement(), depDiez)

function depVeinti(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + 25000
local money = getPlayerMoney(thePlayer) + 1
	if money >= 25000 then
		if checkDep + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, 25000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $25.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:depVeinti", true)
addEventHandler("[SZBank]:depVeinti", getRootElement(), depVeinti)

function depCincuenta(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + 50000
local money = getPlayerMoney(thePlayer) + 1
	if money >= 50000 then
		if checkDep + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, 50000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $50.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:depCincuenta", true)
addEventHandler("[SZBank]:depCincuenta", getRootElement(), depCincuenta)

function depCien(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + 100000
local money = getPlayerMoney(thePlayer) + 1
	if money >= 100000 then
		if checkDep + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, 100000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $100.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer,255, 255, 255, true)
	end
end
addEvent("[SZBank]:depCien", true)
addEventHandler("[SZBank]:depCien", getRootElement(), depCien)

function depDos(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + 250000
local money = getPlayerMoney(thePlayer) + 1
	if money >= 250000 then
		if checkDep + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, 250000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $250.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer,255, 255, 255, true)
	end
end
addEvent("[SZBank]:depDos", true)
addEventHandler("[SZBank]:depDos", getRootElement(), depDos)

function customDep(thePlayer, per)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local new = checkDep + per
local money = getPlayerMoney(thePlayer) + 1
	if money >= tonumber(per) then
		if tonumber(per) + money <= 9223372036854775807 then
			takePlayerMoney(thePlayer, per)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Deposito] El jugador ["..getPlayerName(thePlayer).."] depositó $"..per.." correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF Excedes el límite de dinero, deposita menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer,255, 255, 255, true)
	end
end
addEvent("[SZBank]:customDep", true)
addEventHandler("[SZBank]:customDep", getRootElement(), customDep)

------------------------------------------------------------------------		E		X		T		R		A		C		C		I		O		N		-----------------------------------------------------------------------
function extCinco(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - 5000
	if checkDep + 1 >= 5000 then
		if 5000 + money <= 99999999 then
			givePlayerMoney(thePlayer, 5000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $5.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:extCinco", true)
addEventHandler("[SZBank]:extCinco", getRootElement(), extCinco)

function extDiez(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - 10000
	if checkDep + 1 >= 10000 then
		if 10000 + money <= 99999999 then
			givePlayerMoney(thePlayer, 10000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $10.000 correctamente.")
		else	
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:extDiez", true)
addEventHandler("[SZBank]:extDiez", getRootElement(), extDiez)

function extVeinti(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - 25000
	if checkDep + 1 >= 25000 then
		if 25000 + money <= 99999999 then
			givePlayerMoney(thePlayer, 25000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $25.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:extVeinti", true)
addEventHandler("[SZBank]:extVeinti", getRootElement(), extVeinti)

function extCincuenta(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - 50000
	if checkDep + 1 >= 50000 then
		if 50000 + money <= 99999999 then
			givePlayerMoney(thePlayer, 50000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $50.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:extCincuenta", true)
addEventHandler("[SZBank]:extCincuenta", getRootElement(), extCincuenta)

function extCien(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - 100000
	if checkDep + 1 >= 100000 then
		if 100000 + money <= 99999999 then
			givePlayerMoney(thePlayer, 100000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $100.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:extCien", true)
addEventHandler("[SZBank]:extCien", getRootElement(), extCien)

function extDos(thePlayer)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - 250000
	if checkDep + 1 >= 250000 then
		if 250000 + money <= 99999999 then
			givePlayerMoney(thePlayer, 250000)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $250.000 correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:extDos", true)
addEventHandler("[SZBank]:extDos", getRootElement(), extDos)

function customExt(thePlayer, per2)
local u = getAccountName(getPlayerAccount(thePlayer))
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
local checkDep = check.Depositado 
local money = getPlayerMoney(thePlayer)
local new = checkDep - per2
	if checkDep + 1 >= tonumber(per2) then
		if tonumber(per2) + money <= 99999999 then
			givePlayerMoney(thePlayer, per2)
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, u)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",u) 
			local checkNewDep = checkNew.Depositado
			triggerClientEvent(thePlayer, "[SZBank]:actualizar", getRootElement(), checkNewDep, checkNewDep)
			exports.SZSQL:_Exec("INSERT INTO banklog(Usuario,IP,Serial,Deposito,Extraccion,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Extracción] El jugador ["..getPlayerName(thePlayer).."] extrajo $"..per2.." correctamente.")
		else
			outputChatBox("#DD0606[Error]#FFFFFF No podes extraer esa cantidad, extrae menos.", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF No tenes esa cantidad de dinero.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZBank]:customExt", true)
addEventHandler("[SZBank]:customExt", getRootElement(), customExt)