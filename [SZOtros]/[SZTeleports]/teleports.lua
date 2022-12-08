addEventHandler("onResourceStart",resourceRoot,function(resource)
		if resource then
			outputDebugString(getResourceName(resource) .. ": los teleports se iniciaron correctamente.", 3)
			return true
		else
			outputDebugString(getResourceName(resource) .. ": no se ha podido iniciar los teleports.", 1)
			return false
		end
	end
)

BancoEntrada = createMarker(2127.498046875, 2378.1103515625, 11.4203125, "arrow", 1.5, 0, 0, 255, 255) -- Banco entrada
createBlipAttachedTo(BancoEntrada, 52)
createBlip(2127.498046875, 2378.1103515625, 11.4203125, 52)

BancoSalida = createMarker(246.337890625, 108.4912109375, 1004.21875, "arrow", 1.5, 0, 255, 255, 255, getRootElement()) -- Banco salida
setElementDimension(BancoSalida, 1)  
setElementInterior(BancoSalida, 10) 

ComisariaEntrada = createMarker(2340.099609375, 2457.16796875, 15.5875, "arrow", 1.5, 0, 255, 255, 255, getRootElement()) -- Policia entrada
createBlipAttachedTo(ComisariaEntrada, 30)
createBlip(2340.224609375, 2455.966796875, 14.96875, 30)

ComisariaSalida = createMarker (246.681640625, 63.30078125, 1004.240625, "arrow", 1.5, 0, 255, 255, 255, getRootElement()) -- Policia salida
setElementDimension(ComisariaSalida, 0)  
setElementInterior(ComisariaSalida, 6)

---------------------------------------------------------------------------------------------- [Banco] ----------------------------------------------------------------------------------------------
addEventHandler("onMarkerHit", getRootElement(),
	function(hitElement)
		if getElementType(hitElement) == "player" then
			if not isPedInVehicle(hitElement) then
				if (source == BancoEntrada) then
					setElementPosition(hitElement, 246.337890625, 108.4912109375, 1003.21875)
					setElementDimension(hitElement, 1)
					setElementInterior(hitElement, 10)
					setElementRotation(hitElement, 0, 0, 90)
					toggleControl(hitElement, "fire", false)
					toggleControl(hitElement, "aim_weapon", false)
					toggleControl(hitElement, "next_weapon", false)
					toggleControl(hitElement, "previous_weapon", false)
				elseif (source == BancoSalida) then
					setElementPosition(hitElement, 2127.5751953125, 2374.7587890625, 10.8203125)
					setElementDimension(hitElement, 0)
					setElementInterior(hitElement, 0)
					setElementRotation(hitElement, 0, 0, 180)
					toggleControl(hitElement, "fire", true)
					toggleControl(hitElement, "aim_weapon", true)
					toggleControl(hitElement, "next_weapon", true)
					toggleControl(hitElement, "previous_weapon", true) 
				elseif (source == ComisariaEntrada) then
					setElementPosition(hitElement, 246.5634765625, 66.2470703125, 1003.640625)
					setElementDimension(hitElement, 0)
					setElementInterior(hitElement, 6)
					setElementRotation(hitElement, 0, 0, 0)
					toggleControl(hitElement, "fire", false)
					toggleControl(hitElement, "aim_weapon", false)
					toggleControl(hitElement, "next_weapon", false)
					toggleControl(hitElement, "previous_weapon", false)
				elseif (source == ComisariaSalida) then
					setElementPosition(hitElement, 2337.021484375, 2453.7099609375, 14.96875)
					setElementDimension(hitElement, 0)
					setElementInterior(hitElement, 0)
					setElementRotation(hitElement, 0, 0, 90)
					toggleControl(hitElement, "fire", true)
					toggleControl(hitElement, "aim_weapon", true)
					toggleControl(hitElement, "next_weapon", true)
					toggleControl(hitElement, "previous_weapon", true)
				end
			else
				outputChatBox("#DD0606[Error]#FFFFFF No podes usar el marker estando en vehículos.", hitElement, 255, 255, 255, true)
			end
		end
	end
)