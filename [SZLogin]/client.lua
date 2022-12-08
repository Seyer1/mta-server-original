local screenW, screenH = guiGetScreenSize()
-------------------------------------------------------------------------------Login-------------------------------------------------------------------------------
l_v = guiCreateWindow((screenW - 323) / 2, (screenH - 284) / 2, 323, 284, "[ZS-Login] - by Seyer", false)
guiWindowSetMovable(l_v, false)
guiWindowSetSizable(l_v, false)
guiSetAlpha(l_v, 1.00)

l_u_l = guiCreateLabel(33, 38, 48, 15, "Usuario:", false, l_v)
guiSetFont(l_u_l, "default-bold-small")
guiLabelSetHorizontalAlign(l_u_l, "left", true)

l_u_e = guiCreateEdit(87, 30, 226, 33, "", false, l_v)
guiEditSetMaxLength(l_u_e, 25)
    
l_max_u = guiCreateLabel(257, 63, 56, 15, "(máx. 25)", false, l_v)
guiSetFont(l_max_u, "default-bold-small")
guiLabelSetColor(l_max_u, 254, 0, 0)
    
l_c_l = guiCreateLabel(10, 102, 71, 16, "Contraseña:", false, l_v)
guiSetFont(l_c_l, "default-bold-small")

l_c_e = guiCreateEdit(87, 95, 226, 33, "", false, l_v)
guiEditSetMasked(l_c_e, true)
guiEditSetMaxLength(l_c_e, 25)

l_max_c = guiCreateLabel(257, 128, 56, 15, "(máx. 25)", false, l_v)
guiSetFont(l_max_c, "default-bold-small")
guiLabelSetColor(l_max_c, 254, 0, 0)
   
l_l_b = guiCreateButton(9, 163, 304, 48, "Login", false, l_v)
guiSetFont(l_l_b, "default-bold-small")
guiSetProperty(l_l_b, "NormalTextColour", "FFAAAAAA")

l_r_b = guiCreateButton(9, 221, 304, 48, "Register", false, l_v)
guiSetFont(l_r_b, "default-bold-small")
guiSetProperty(l_r_b, "NormalTextColour", "FFAAAAAA")

-------------------------------------------------------------------------------Register-------------------------------------------------------------------------------

r_v = guiCreateWindow((screenW - 326) / 2, (screenH - 340) / 2, 326, 340, "[ZS-Register] - by Seyer", false)
guiWindowSetMovable(r_v, false)
guiWindowSetSizable(r_v, false)
guiSetAlpha(r_v, 1.00)

r_u_l = guiCreateLabel(33, 38, 48, 15, "Usuario:", false, r_v)
guiSetFont(r_u_l, "default-bold-small")
guiLabelSetHorizontalAlign(r_u_l, "left", true)

r_u_e = guiCreateEdit(87, 30, 226, 33, "", false, r_v)
guiEditSetMaxLength(r_u_e, 25)

r_max_u = guiCreateLabel(257, 63, 56, 15, "(máx. 25)", false, r_v)
guiSetFont(r_max_u, "default-bold-small")
guiLabelSetColor(r_max_u, 254, 0, 0)

r_c_l = guiCreateLabel(10, 102, 71, 16, "Contraseña:", false, r_v)
guiSetFont(r_c_l, "default-bold-small")

r_c_e = guiCreateEdit(87, 95, 226, 33, "", false, r_v)
guiEditSetMasked(r_c_e, true)
guiEditSetMaxLength(r_c_e, 25)

r_max_c = guiCreateLabel(257, 128, 56, 15, "(máx. 25)", false, r_v)
guiSetFont(r_max_c, "default-bold-small")
guiLabelSetColor(r_max_c, 254, 0, 0)

r_r_b = guiCreateButton(9, 224, 304, 48, "Register", false, r_v)
guiSetFont(r_r_b, "default-bold-small")
guiSetProperty(r_r_b, "NormalTextColour", "FFAAAAAA")

r_l_b = guiCreateButton(9, 282, 304, 48, "Login", false, r_v)
guiSetFont(r_l_b, "default-bold-small")
guiSetProperty(r_l_b, "NormalTextColour", "FFAAAAAA")

r_e_c2 = guiCreateEdit(87, 153, 226, 33, "", false, r_v)
guiEditSetMasked(r_e_c2, true)
guiEditSetMaxLength(r_e_c2, 25)

r_max_c2 = guiCreateLabel(257, 186, 56, 15, "(máx. 25)", false, r_v)
guiSetFont(r_max_c2, "default-bold-small")
guiLabelSetColor(r_max_c2, 254, 0, 0)

r_repetir_l = guiCreateLabel(25, 157, 45, 13, "Repetir", false, r_v)
guiSetFont(r_repetir_l, "default-bold-small")

r_c2_l = guiCreateLabel(10, 170, 71, 16, "contraseña:", false, r_v)
guiSetFont(r_c2_l, "default-bold-small")
-------------------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
guiSetVisible(r_v, false)
guiSetInputEnabled(true)
showCursor(true)
function panel()
    guiSetVisible(l_v, not guiGetVisible(r_v))
end

addEventHandler("onClientGUIClick", root, function()
	if (source == l_l_b) then
	local u = guiGetText(l_u_e)
	local p1 = guiGetText(l_c_e)
		guiSetInputEnabled(not guiGetInputEnabled())
		if u == "" and p1 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa el usuario y la contraseña.", 255, 255, 255, true)
		elseif u == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa el usuario.", 255, 255, 255, true)
		elseif p1 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa la contraseña.", 255, 255, 255, true)
		else
			triggerServerEvent("[SZLogin]:login", getLocalPlayer(), getLocalPlayer(), u, p1)
			showCursor(false)
		end
	elseif (source == r_r_b) then
	local p1 = guiGetText(r_c_e)
	local p2 = guiGetText(r_e_c2)
	local u = guiGetText(r_u_e)
		guiSetInputEnabled(not guiGetInputEnabled())
		if u == "" and p1 == "" and p2 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, rellena todos los campos.", 255, 255, 255, true)
		elseif u == "" and p1 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa el usuario y la contraseña.", 255, 255, 255, true)
		elseif u == "" and p2 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa el usuario y repetí la contraseña.", 255, 255, 255, true)
		elseif p1 == "" and p2 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa una contraseña y repetila.", 255, 255, 255, true)
		elseif u == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa un usuario.", 255, 255, 255, true)
		elseif p1 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, ingresa una contraseña.", 255, 255, 255, true)
		elseif p2 == "" then
			outputChatBox("#DD0606[Error]#FFFFFF Por favor, repeti la contraseña.", 255, 255, 255, true)
		elseif (#u < 5) then
			outputChatBox("#FF0000[#DD0606Error]#FFFFFF Por favor, ingresa un usuario mayor o igual a 5 caracteres.", 255, 255, 255, true)
		elseif (#p1 < 6) then
			outputChatBox("#FF0000[#DD0606Error]#FFFFFF Por favor, ingresa una contraseña mayor o igual a 6 caracteres.", 255, 255, 255, true)
		elseif p1 ~= p2 then
			outputChatBox("#DD0606[Error]#FFFFFF Las contraseñas no son iguales.", 255, 255, 255, true)
		else
			triggerServerEvent("[SZLogin]:register", getLocalPlayer(), getLocalPlayer(), u, p1)
			showCursor(false)
		end
	elseif (source == r_l_b) then
		guiSetVisible(r_v, false)
		guiSetVisible(l_v, true)
	elseif (source == l_r_b) then
		guiSetVisible(l_v, false)
		guiSetVisible(r_v, true)
	end
end, true)

function cerrar()
    guiSetVisible(l_v, false)
    guiSetVisible(r_v, false)
	showCursor(false)
	if guiGetInputEnabled then
		guiSetInputEnabled(false)
	end
	if isCursorShowing () then
		showCursor(false)
	else
		showCursor(false)
	end
end
addEvent("[SZLogin]:cerrar", true)
addEventHandler("[SZLogin]:cerrar", getLocalPlayer(), cerrar)

function mostrar()
	if not isCursorShowing() then
		showCursor(true)
	else
		showCursor(true)
	end
end
addEvent("[SZLogin]:show", true)
addEventHandler("[SZLogin]:show", getLocalPlayer(), mostrar)