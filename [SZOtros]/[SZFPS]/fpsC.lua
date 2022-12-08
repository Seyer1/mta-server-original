FPSLimit = 100
FPSMax = 100

function onClientResourceStart(resource)
	if ( guiFPSLabel == nil ) then
		FPSLimit = 255 / FPSLimit
		guiFPSLabel	= guiCreateLabel(0.03, 0.97, 0.1, 0.1, "FPS: 0", true)
		FPSCalc = 0
		FPSTime = getTickCount() + 1000
	end
end
addEventHandler ( "onClientResourceStart", getRootElement (), onClientResourceStart)

function onClientRender ( )
	if (getTickCount() < FPSTime) then
		FPSCalc = FPSCalc + 1
	else
		--if (FPSCalc > FPSMax) then FPSLimit = 255/FPSCalc FPSMax = FPSCalc end
		guiSetText (guiFPSLabel, "FPS: "..FPSCalc.." Max: "..FPSMax)
		if FPSCalc > 80 then
			guiLabelSetColor(guiFPSLabel, 0, 255, 0) 
			FPSCalc = 0
			FPSTime = getTickCount() + 1000
		elseif FPSCalc < 80 then
			guiLabelSetColor(guiFPSLabel, 140, 255, 26)
		elseif FPSCalc > 60 then
			guiLabelSetColor(guiFPSLabel, 0, 204, 255)
		elseif FPSCalc < 60 then
			guiLabelSetColor(guiFPSLabel, 204, 102, 0)
		elseif FPSCalc < 30 then
			guiLabelSetColor(guiFPSLabel, 255, 102, 102)
		elseif FPSCalc < 20 then
			guiLabelSetColor(guiFPSLabel, 255, 0, 0)
		end
	end
end
addEvent("[SZFPS]:refresh", true)
addEventHandler("[SZFPS]:refresh", getRootElement(), onClientRender)
addEventHandler("onClientRender", getRootElement (), onClientRender)
addEventHandler("onClientResourceStart", resourceRoot, onClientRender)