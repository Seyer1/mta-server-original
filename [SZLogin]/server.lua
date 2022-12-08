addEventHandler("onResourceStart",resourceRoot,function(resource)
	if resource then
		outputDebugString(getResourceName(resource) .. ": el login se inició correctamente.", 3)
		return true
	else
		outputDebugString(getResourceName(resource) .. ": no se ha podido iniciar el login.", 1)
		return false
	end
end)

local time = getRealTime()
local year = time.year + 1900
local month = time.month + 1
local monthday = time.monthday 
local hours = time.hour
local minutes = time.minute
local second = time.second
	if		(month < 10)		then		month = 0 ..month			end
	if		(monthday < 10) 	then 		monthday = 0 ..monthday		end
	if		(hours < 10) 		then 		hours = 0 ..hours			end
	if		(minutes < 10) 		then 		minutes = 0 ..minutes		end
	if		(second < 10) 		then 		second = 0 ..second 		end
local dAy = year.."-"..month.."-"..monthday.." "..hours..":"..minutes..":"..second

function registerRequest(thePlayer, u, p1)
    if isGuestAccount(getPlayerAccount(thePlayer)) then
	local ip = getPlayerIP(thePlayer)
	local serial = getPlayerSerial(thePlayer)
		if not getAccount(u) then
		local sha = sha256(p1)
		local aa = addAccount(tostring(u), tostring(sha))
			if aa then
			local money = givePlayerMoney(thePlayer, 5000)
				logIn(thePlayer, getAccount(u),tostring(sha))
				outputChatBox("#009999[Info]#FFFFFF Te registraste exitosamente.", thePlayer, 255, 255, 255, true)
				outputDebugString("[Registro] Usuario: ["..getPlayerName(thePlayer).."] | Cuenta: ["..u.."] | Serial: [" ..serial.."] | IP: ["..ip.."] se registró en el servidor.")
				exports.SZSQL:_Exec("INSERT INTO users(Usuario,Password,IP,Serial,Dinero,Vida,Armor,Skin,x,y,z,xr,Team,Rank,Registro) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",u,sha,ip,serial,money,100,0,26,1674.18359375, 1447.8720703125, 10.783271789551,-90,"Desempleado",0,dAy)
				exports.SZSQL:_Exec("INSERT INTO loginlog(Usuario,IP,Serial,Registro,Login,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Registro] El usuario ["..u.."] se registró correctamente.")
				spawnPlayer(thePlayer, 1674.18359375, 1447.8720703125, 10.783271789551, -90)
				setElementModel(thePlayer, 26)
				setPlayerTeam(thePlayer, "Desempleado")
				triggerClientEvent(thePlayer, "[SZLogin]:cerrar", getRootElement())
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF La cuenta ya existe.", thePlayer, 255, 255, 255, true)
			exports.SZSQL:_Exec("INSERT INTO loginlog(Usuario,IP,Serial,Registro,Login,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Sep","Nope","[Error] El jugador ["..getPlayerName(thePlayer).."] trató de registrase con el usuario ya existente ["..u.."].")
			triggerClientEvent(thePlayer, "[SZLogin]:show", getRootElement())
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF Tenes que estar desconectado para usar este panel.", thePlayer, 255, 255, 255, true)
	end
end
addEvent("[SZLogin]:register", true)
addEventHandler("[SZLogin]:register", getRootElement(), registerRequest)

function loginRequest(thePlayer, u, p1)
local acc = getAccount(u)
local sha = sha256(p1)
local ip = getPlayerIP(thePlayer)
local serial = getPlayerSerial(thePlayer)
local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?",u)
	if check then
	local checkS = check.Serial
	local checkP = check.Password
	local checkR = check.Rank
		if (checkS == serial) then
			if (checkP == sha) then
				logIn(thePlayer, getAccount(u),tostring(sha))
				triggerClientEvent(thePlayer, "[SZLogin]:cerrar", getRootElement())
				outputChatBox("#009999[Info]#FFFFFF Te logeaste correctamente.", thePlayer, 255, 255, 255, true)
				outputDebugString("El usuario: ["..getPlayerName(thePlayer).."] | Cuenta: ["..u.."] | Serial: [" ..serial.."] | IP: ["..ip.."] se conectó al servidor.")
				exports.SZSQL:_Exec("INSERT INTO loginlog(Usuario,IP,Serial,Registro,Login,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Login] El jugador ["..getPlayerName(thePlayer).."] se conectó correctamente.")
			else
				outputChatBox("#DD0606[Error]#FFFFFF La contraseña no es correcta.", thePlayer, 255, 255, 255, true)
				exports.SZSQL:_Exec("INSERT INTO loginlog(Usuario,IP,Serial,Registro,Login,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Error] El jugador ["..getPlayerName(thePlayer).."] introdujo una contraseña incorrecta.")
				triggerClientEvent(thePlayer, "[SZLogin]:show", getRootElement())
			end
		else
			outputChatBox("#DD0606[Error]#FFFFFF La cuenta pertenece a otra pc.", thePlayer, 255, 255, 255, true)
			outputDebugString("El jugador ["..getPlayerName(thePlayer).."] trató de conectarse a la cuenta ["..u.."] con el Serial [" ..serial.."] y la IP ["..ip.."].")
			exports.SZSQL:_Exec("INSERT INTO loginlog(Usuario,IP,Serial,Registro,Login,Text) VALUES(?,?,?,?,?,?)",u,ip,serial,"Nope","Sep","[Error] El usuario ["..getPlayerName(thePlayer).."] trató de conectarse a la cuenta ["..u.."] con el Serial [" ..serial.."] y la IP ["..ip.."].")
			triggerClientEvent(thePlayer, "[SZLogin]:show", getRootElement())
		end
	else
		outputChatBox("#DD0606[Error]#FFFFFF La cuenta no existe.", thePlayer, 255, 255, 255, true)
		triggerClientEvent(thePlayer, "[SZLogin]:show", getRootElement())
	end
end
addEvent("[SZLogin]:login", true)
addEventHandler("[SZLogin]:login", getRootElement(), loginRequest)
