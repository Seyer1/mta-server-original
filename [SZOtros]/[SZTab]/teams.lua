addEventHandler("onResourceStart",resourceRoot,function(resource)
		if resource then
			createTeam("Desempleado", 217, 217, 217)
			createTeam("Policia", 102, 204, 255)
			createTeam("SWAT", 51, 153, 255)
			createTeam("FBI", 0, 115, 230)	
			exports.scoreboard:scoreboardAddColumn("Dinero") 
			outputDebugString(getResourceName(resource) .. ": los teams se crearon correctamente.", 3)
			return true
		else
			outputDebugString(getResourceName(resource) .. ": no se ha podido iniciar el banco.", 1)
			return false
		end
	end
)

function actualizar()
	for _, v in ipairs(getElementsByType("player")) do
		if v ~= nil then
			setElementData(v, "Dinero", getPlayerMoney(v))
		end
	end
end
setTimer(actualizar, 1000, 0)