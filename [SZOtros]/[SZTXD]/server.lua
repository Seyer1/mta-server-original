addEventHandler("onResourceStart",resourceRoot,function(resource)
		if resource then
			outputDebugString(getResourceName(resource) .. ": los TXD se reemplazaron correctamente.", 3)
			return true
		else
			outputDebugString(getResourceName(resource) .. ": no se ha podido reemplazar los TXD.", 1)
			return false
		end
	end
)