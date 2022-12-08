addEventHandler("onResourceStart",resourceRoot,function(resource)
		if resource then
			outputDebugString(getResourceName(resource) .. ": se ha establecido el limite de 100fps correctamente.", 3)
			return true
		else
			outputDebugString(getResourceName(resource) .. ": no se ha podido establecer el limite de 100fps.", 1)
			return false
		end
	end
)

function fps()
	setFPSLimit(100)
end
addEventHandler("onResourceStart", getRootElement(), fps)

function refresh()
	triggerClientEvent(getRootElement(),"[SZFPS]:refresh", getRootElement())
end
addEventHandler("onPlayerLogin", getRootElement(), refresh)
addEventHandler("onPlayerWasted", getRootElement(), refresh)
addEventHandler("onResourceStop", resourceRoot, refresh)