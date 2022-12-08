local screenW, screenH = guiGetScreenSize()
--------------------------------------------------------------------------------------    Conseguir    --------------------------------------------------------------------------------------
c_v = guiCreateWindow((screenW - 394) / 2, (screenH - 146) / 2, 394, 146, "Conseguir tarjeta", false)
guiWindowSetMovable(c_v, false)
guiWindowSetSizable(c_v, false)

lc_v = guiCreateLabel(14, 23, 370, 30, "Actualmente no tenes tarjeta por lo que no podrás usar el banco, \n                                             ¿querés conseguirla?", false, c_v)
guiSetFont(lc_v, "default-bold-small")
guiLabelSetColor(lc_v, 1, 227, 253)

sic_v = guiCreateButton(47, 73, 140, 62, "Si", false, c_v)
guiSetFont(sic_v, "sa-header")
guiSetProperty(sic_v, "NormalTextColour", "FFFCFF0F")

noc_v = guiCreateButton(214, 73, 136, 62, "NO", false, c_v)
guiSetFont(noc_v, "sa-header") 
guiSetProperty(noc_v, "NormalTextColour", "FFFCFF0F")

--------------------------------------------------------------------------------------   Confirmación    --------------------------------------------------------------------------------------
conf_v = guiCreateWindow((screenW - 341) / 2, (screenH - 138) / 2, 341, 138, "Confirmar tarjeta", false)
guiWindowSetMovable(conf_v, false)
guiWindowSetSizable(conf_v, false)

lconf_v = guiCreateLabel(14, 33, 272, 15, "                              ¿Estas seguro? Sale $50.000", false, conf_v)
guiSetFont(lconf_v, "default-bold-small")
guiLabelSetColor(lconf_v, 17, 254, 0)
        
siconf_v = guiCreateButton(14, 63, 140, 62, "Si", false, conf_v)
guiSetFont(siconf_v, "sa-header")
guiSetProperty(siconf_v, "NormalTextColour", "FFFCFF0F")
        
noconf_v = guiCreateButton(192, 63, 136, 62, "NO", false, conf_v)
guiSetFont(noconf_v, "sa-header")
guiSetProperty(noconf_v, "NormalTextColour", "FFFCFF0F")
--------------------------------------------------------------------------------------   Main   --------------------------------------------------------------------------------------
b_v = guiCreateWindow((screenW - 418) / 2, (screenH - 164) / 2, 418, 164, "[ZSBank] - by Seyer", false)
guiWindowSetMovable(b_v, false)
guiWindowSetSizable(b_v, false)

e_b = guiCreateButton(230, 85, 177, 68,  "Extraer", false, b_v)
guiSetFont(e_b, "default-bold-small")
guiSetProperty(e_b, "NormalTextColour", "FF29FE00")
        
d_b = guiCreateButton(10, 85, 177, 68, "Depositar", false, b_v)
guiSetFont(d_b, "default-bold-small")
guiSetProperty(d_b, "NormalTextColour", "FF29FE00")
        
l_b = guiCreateLabel(23, 33, 582, 31, "                     El banco Credicoop te da la bienvenida, "..getPlayerName(localPlayer)..".\n                            Acá podrás extraer y depositar dinero.", false, b_v)
guiSetFont(l_b, "default-bold-small")
guiLabelSetColor(l_b, 41, 254, 0)

xc_l = guiCreateLabel(398, 22, 18, 15, "X", false, b_v)
guiSetFont(xc_l, "default-bold-small")
guiLabelSetColor(xc_l, 41, 254, 0)

--------------------------------------------------------------------------------------   Extraccion   --------------------------------------------------------------------------------------
e_v = guiCreateWindow((screenW - (-418)) / 2, (screenH - 164) / 2, 281, 289, "Extracción", false)
guiWindowSetMovable(e_v, false)
guiWindowSetSizable(e_v, false)

d_l = guiCreateLabel(10, 41, 261, 22, "Dinero depositado: $0", false, e_v)
guiSetFont(d_l, "default-bold-small")
guiLabelSetColor(d_l, 41, 254, 0)

ck_r = guiCreateRadioButton(12, 100, 60, 15, "5.000", false, e_v)
guiSetFont(ck_r, "default-bold-small")
guiSetProperty(ck_r, "NormalTextColour", "FFF5FE00")

c_l = guiCreateLabel(72, 73, 143, 17, "¿Cuánto querés extraer?", false, e_v)
guiSetFont(c_l, "default-bold-small")
guiLabelSetColor(c_l, 41, 254, 0)

dk_r = guiCreateRadioButton(113, 100, 60, 15, "10.000", false, e_v)
guiSetFont(dk_r, "default-bold-small")
guiSetProperty(dk_r, "NormalTextColour", "FFF5FE00")

vk_r = guiCreateRadioButton(207, 100, 60, 15, "25.000", false, e_v)
guiSetFont(vk_r, "default-bold-small")
guiSetProperty(vk_r, "NormalTextColour", "FFF5FE00")
        
cik_r = guiCreateRadioButton(12, 130, 60, 15, "50.000", false, e_v)
guiSetFont(cik_r, "default-bold-small")
guiSetProperty(cik_r, "NormalTextColour", "FFF5FE00")

cienk_r = guiCreateRadioButton(113, 130, 65, 15, "100.000", false, e_v)
guiSetFont(cienk_r, "default-bold-small")
guiSetProperty(cienk_r, "NormalTextColour", "FFF5FE00")

dosk_r = guiCreateRadioButton(207, 130, 64, 15, "250.000", false, e_v)
guiSetFont(dosk_r, "default-bold-small")
guiSetProperty(dosk_r, "NormalTextColour", "FFF5FE00")

p_r = guiCreateRadioButton(92, 159, 99, 17, "Personalizado", false, e_v)
guiSetFont(p_r, "default-bold-small")
guiSetProperty(p_r, "NormalTextColour", "FFF5FE00")

p_e = guiCreateEdit(13, 186, 258, 33, "", false, e_v)
guiEditSetMaxLength(p_e, 8)

e_bb = guiCreateButton(13, 229, 258, 46, "Extraer", false, e_v)
guiSetFont(e_bb, "default-bold-small")
guiSetProperty(e_bb, "NormalTextColour", "FF29FE00")
        
xe_l = guiCreateLabel(263, 22, 18, 15, "X", false, e_v)
guiSetFont(xe_l, "default-bold-small")
guiLabelSetColor(xe_l, 41, 254, 0)

-------------------------------------------------------------------------------------------   Depósito   -----------------------------------------------------------------------------------
d_v = guiCreateWindow((screenW - 980) / 2, (screenH - 164) / 2, 281, 289, "Depósito", false)
guiWindowSetMovable(d_v, false)
guiWindowSetSizable(d_v, false)

dl_l = guiCreateLabel(10, 41, 261, 22, "Dinero depositado: $0", false, d_v)
guiSetFont(dl_l, "default-bold-small")
guiLabelSetColor(dl_l, 41, 254, 0)
        
ckd_r = guiCreateRadioButton(12, 100, 60, 15, "5.000", false, d_v)
guiSetFont(ckd_r, "default-bold-small")
guiSetProperty(ckd_r, "NormalTextColour", "FFF5FE00")

dp_l = guiCreateLabel(64, 73, 153, 17, "¿Cuánto querés depositar?", false, d_v)
guiSetFont(dp_l, "default-bold-small")
guiLabelSetColor(dp_l, 41, 254, 0)
        
dkd_r = guiCreateRadioButton(113, 100, 60, 15, "10.000", false, d_v)
guiSetFont(dkd_r, "default-bold-small")
guiSetProperty(dkd_r, "NormalTextColour", "FFF5FE00")
        
vkd_r = guiCreateRadioButton(207, 100, 60, 15, "25.000", false, d_v)
guiSetFont(vkd_r, "default-bold-small")
guiSetProperty(vkd_r, "NormalTextColour", "FFF5FE00")
        
cikd_r = guiCreateRadioButton(12, 130, 60, 15, "50.000", false, d_v)
guiSetFont(cikd_r, "default-bold-small")
guiSetProperty(cikd_r, "NormalTextColour", "FFF5FE00")
        
cienkd_r = guiCreateRadioButton(113, 130, 65, 15, "100.000", false, d_v)
guiSetFont(cienkd_r, "default-bold-small")
guiSetProperty(cienkd_r, "NormalTextColour", "FFF5FE00")
        
doskd_r = guiCreateRadioButton(207, 130, 64, 15, "250.000", false, d_v)
guiSetFont(doskd_r, "default-bold-small")
guiSetProperty(doskd_r, "NormalTextColour", "FFF5FE00")
       
pd_d = guiCreateRadioButton(92, 159, 99, 17, "Personalizado", false, d_v)
guiSetFont(pd_d, "default-bold-small")
guiSetProperty(pd_d, "NormalTextColour", "FFF5FE00")

d_e = guiCreateEdit(13, 186, 258, 33, "", false, d_v)
guiEditSetMaxLength(d_e, 8)

d_bb = guiCreateButton(13, 229, 258, 46, "Depositar", false, d_v)
guiSetFont(d_bb, "default-bold-small")
guiSetProperty(d_bb, "NormalTextColour", "FF29FE00")

xddd_l = guiCreateLabel(263, 22, 18, 15, "X", false, d_v)
guiSetFont(xddd_l, "default-bold-small")
guiLabelSetColor(xddd_l, 41, 254, 0)

--------------------------------------------------------------------------------------   Principal   --------------------------------------------------------------------------------------
guiSetVisible(b_v, false)
guiSetVisible(e_v, false)
guiSetVisible(d_v, false)
guiSetVisible(c_v, false)
guiSetVisible(conf_v, false)

function cerrar()
	guiSetVisible(b_v, false)
	guiSetVisible(e_v, false)
	guiSetVisible(d_v, false)
	guiSetVisible(c_v, false)
	guiSetVisible(conf_v, false)
	showCursor(false)
end

function c()
	triggerServerEvent("[SZBank]:main", getLocalPlayer(), getLocalPlayer())
end
addEventHandler( "onClientResourceStart", getRootElement( ), c)

function conseguir()
	guiSetVisible(c_v, true)
	showCursor(true)
end	
addEvent("[SZBank]:conseguir", true)
addEventHandler("[SZBank]:conseguir", getLocalPlayer(), conseguir)

function abrir()
	guiSetVisible(b_v, true)
	guiSetVisible(e_v, false)
	guiSetVisible(d_v, false)
	showCursor(true)
end
addEvent("[SZBank]:abrir", true)
addEventHandler("[SZBank]:abrir", getLocalPlayer(), abrir)

addEventHandler("onClientGUIClick", root, function(thePlayer)
	if (source == xc_l) then
		guiSetVisible(b_v, false)
		guiSetVisible(e_v, false)
		guiSetVisible(d_v, false)
		showCursor(false)
	elseif (source == d_b) then
		guiSetVisible(d_v, true)
	elseif (source == xddd_l) then
		guiSetVisible(d_v, false)
	elseif (source == e_b) then
		guiSetVisible(e_v, true)
	elseif (source == xe_l) then
		guiSetVisible(e_v, false)
	elseif (source == sic_v) then
		guiSetVisible(c_v, false)
		guiSetVisible(conf_v, true)
		showCursor(true)
	elseif (source == noc_v) then
		guiSetVisible(c_v, false)
		showCursor(false)
	elseif (source == siconf_v) then
		triggerServerEvent("[SZBank]:confirm", getLocalPlayer(), getLocalPlayer())
		guiSetVisible(conf_v, false)
		showCursor(false)
	elseif (source == noconf_v) then
		guiSetVisible(conf_v, false)
		showCursor(false)
	elseif (source == d_bb) then
	local per = guiGetText(d_e)
		if guiRadioButtonGetSelected(ckd_r) then
			triggerServerEvent("[SZBank]:depCinco", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(ckd_r) then
			guiRadioButtonSetSelected(pd_d, true)
		elseif guiRadioButtonGetSelected(dkd_r) then
			triggerServerEvent("[SZBank]:depDiez", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(vkd_r) then
			triggerServerEvent("[SZBank]:depVeinti", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(cikd_r) then
			triggerServerEvent("[SZBank]:depCincuenta", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(cienkd_r) then
			triggerServerEvent("[SZBank]:depCien", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(doskd_r) then
			triggerServerEvent("[SZBank]:depDos", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(pd_d) then
			if (per) ~= "" then
				if tonumber(per) then
					if tonumber(per) >= 1 then
						triggerServerEvent("[SZBank]:customDep", getLocalPlayer(), getLocalPlayer(), per)
					else
						outputChatBox("#DD0606[Error]#FFFFFF La cantidad mínima a depositar es $1.", 255, 255, 255, true)
					end
				else
					outputChatBox("#DD0606[Error]#FFFFFF Solo podes poner números.", 255, 255, 255, true)
				end
			else
				outputChatBox("#DD0606[Error]#FFFFFF Completa el campo.", 255, 255, 255, true)
			end
		end
	elseif (source == e_bb) then
	local per2 = guiGetText(p_e)
		if guiRadioButtonGetSelected(ck_r) then
			triggerServerEvent("[SZBank]:extCinco", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(dk_r) then
			triggerServerEvent("[SZBank]:extDiez", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(vk_r) then
			triggerServerEvent("[SZBank]:extVeinti", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(cik_r) then
			triggerServerEvent("[SZBank]:extCincuenta", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(cienk_r) then
			triggerServerEvent("[SZBank]:extCien", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(dosk_r) then
			triggerServerEvent("[SZBank]:extDos", getLocalPlayer(), getLocalPlayer())
		elseif guiRadioButtonGetSelected(p_r) then
			if (per2) ~= "" then
				if tonumber(per2) then
					if tonumber(per2) >= 1 then
						triggerServerEvent("[SZBank]:customExt", getLocalPlayer(), getLocalPlayer(), per2)
					else
						outputChatBox("#DD0606[Error]#FFFFFF La cantidad mínima a extraer es $1.", 255, 255, 255, true)
					end
				else
					outputChatBox("#DD0606[Error]#FFFFFF Solo podes poner números.", 255, 255, 255, true)
				end
			else
				outputChatBox("#DD0606[Error]#FFFFFF Completa el campo.", 255, 255, 255, true)
			end
		end
	end
end, true)

function act(checkNewDep)
	guiSetText(dl_l, "Dinero depositado: $"..checkNewDep)
	guiSetText(d_l, "Dinero depositado: $"..checkNewDep)
end
addEvent("[SZBank]:actualizar", true)
addEventHandler("[SZBank]:actualizar", getLocalPlayer(), act)