local screenW, screenH = guiGetScreenSize()

pa_v = guiCreateWindow((screenW - 883) / 2, (screenH - 519) / 2, 883, 519, "[SZAdmin] - by Seyer", false)
guiWindowSetMovable(pa_v, false)
guiWindowSetSizable(pa_v, false)

player_gridlist = guiCreateGridList(10, 23, 199, 486, false, pa_v)
column = guiGridListAddColumn(player_gridlist, "Player", 1)
panel_tab = guiCreateTabPanel(219, 23, 654, 486, false, pa_v)

-----------------------------------------------------------------------------------------------[		A	d	m 	-	T	a	b		]-----------------------------------------------------------------------------------------------
adm_tab = guiCreateTab("Admin", panel_tab)

player_label = guiCreateLabel(10, 10, 38, 15, "Player:", false, adm_tab)
guiSetFont(player_label, "default-bold-small")
guiLabelSetColor(player_label, 255, 0, 0)
        
name_label = guiCreateLabel(20, 35, 213, 15, "Name: N/A", false, adm_tab)
guiSetFont(name_label, "default-bold-small")

cuenta_label = guiCreateLabel(20, 60, 249, 15, "Cuenta: N/A", false, adm_tab)
guiSetFont(cuenta_label, "default-bold-small")

ip_label = guiCreateLabel(20, 85, 146, 15, "IP: N/A", false, adm_tab)
guiSetFont(ip_label, "default-bold-small")

serial_label = guiCreateLabel(20, 110, 370, 17, "Serial: N/A", false, adm_tab)
guiSetFont(serial_label, "default-bold-small")

game_label = guiCreateLabel(11, 133, 37, 15, "Game:", false, adm_tab)
guiSetFont(game_label, "default-bold-small")
guiLabelSetColor(game_label, 255, 0, 0)

hp_label = guiCreateLabel(20, 158, 58, 16, "HP: N/A", false, adm_tab)
guiSetFont(hp_label, "default-bold-small")

skin_label = guiCreateLabel(20, 233, 66, 16, "Skin: N/A", false, adm_tab) 
guiSetFont(skin_label, "default-bold-small")

armor_label = guiCreateLabel(19, 183, 77, 15, "Armor: N/A", false, adm_tab)  
guiSetFont(armor_label, "default-bold-small")

dinero_label = guiCreateLabel(20, 208, 326, 15, "Dinero: N/A", false, adm_tab)
guiSetFont(dinero_label, "default-bold-small")

team_label = guiCreateLabel(20, 259, 222, 15, "Team: N/A", false, adm_tab)
guiSetFont(team_label, "default-bold-small")

dim_label = guiCreateLabel(21, 284, 184, 15, "Dimension: N/A", false, adm_tab)
guiSetFont(dim_label, "default-bold-small")

int_label = guiCreateLabel(21, 309, 184, 15, "Interior: N/A", false, adm_tab)
guiSetFont(int_label, "default-bold-small")

veh_label = guiCreateLabel(11, 334, 55, 15, "Vehiculo:", false, adm_tab)
guiSetFont(veh_label, "default-bold-small")
guiLabelSetColor(veh_label, 255, 0, 0)

vehicle_label = guiCreateLabel(20, 359, 184, 15, "Vehicle: N/A", false, adm_tab)
guiSetFont(vehicle_label, "default-bold-small")

idauto_label = guiCreateLabel(20, 409, 184, 15, "ID: N/A", false, adm_tab)
guiSetFont(idauto_label, "default-bold-small")

reload_button = guiCreateButton(400, 35, 119, 34, "Reload", false, adm_tab)
guiSetFont(reload_button, "default-bold-small")
guiSetProperty(reload_button, "NormalTextColour", "FF0BFD00")

reloadpos_button = guiCreateButton(529, 35, 119, 34, "ReloadPos", false, adm_tab)
guiSetFont(reloadpos_button, "default-bold-small")
guiSetProperty(reloadpos_button, "NormalTextColour", "FF0BFD00")

vehhp_label = guiCreateLabel(21, 434, 184, 15, "Vehicle HP: N/A", false, adm_tab)
guiSetFont(vehhp_label, "default-bold-small")

checkAuto_label = guiCreateLabel(21, 384, 184, 15, "Es suyo?: N/A", false, adm_tab)
guiSetFont(checkAuto_label, "default-bold-small")


-----------------------------------------------------------------------------------------------[	B	a	n	k 	-	T	a	b	]-----------------------------------------------------------------------------------------------
bank_tab = guiCreateTab("Bank", panel_tab)

playerBank_label = guiCreateLabel(10, 10, 44, 15, "Player:", false, bank_tab)
guiSetFont(playerBank_label, "default-bold-small")
guiLabelSetColor(playerBank_label, 255, 0, 0)

nameBank_label = guiCreateLabel(20, 35, 211, 15, "Name: N/A", false, bank_tab)
guiSetFont(nameBank_label, "default-bold-small")
        
cuentaBank_label = guiCreateLabel(20, 60, 211, 15, "Cuenta: N/A", false, bank_tab)
guiSetFont(cuentaBank_label, "default-bold-small")

ipBank_label = guiCreateLabel(20, 85, 211, 15, "IP: N/A", false, bank_tab)
guiSetFont(ipBank_label, "default-bold-small")

serialBank_label = guiCreateLabel(20, 110, 327, 15, "Serial: N/A", false, bank_tab)
guiSetFont(serialBank_label, "default-bold-small")

bank_label = guiCreateLabel(347, 10, 44, 15, "Bank:", false, bank_tab)
guiSetFont(bank_label, "default-bold-small")
guiLabelSetColor(bank_label, 255, 0, 0)

tieneBank_label = guiCreateLabel(359, 35, 211, 15, "¿Tiene tarjeta?: N/A", false, bank_tab)
guiSetFont(tieneBank_label, "default-bold-small")

tipoBank_label = guiCreateLabel(359, 60, 211, 15, "Tipo de tarjeta: N/A", false, bank_tab)
guiSetFont(tipoBank_label, "default-bold-small")

depBank_label = guiCreateLabel(359, 85, 211, 15, "Depositado: N/A", false, bank_tab)
guiSetFont(depBank_label, "default-bold-small")

agregarBank_radio = guiCreateRadioButton(251, 161, 156, 15, "Agregarle a su deposito", false, bank_tab)
guiSetFont(agregarBank_radio, "default-bold-small")
guiSetProperty(agregarBank_radio, "NormalTextColour", "FFFEF500")

agregarBank_label = guiCreateEdit(155, 186, 349, 31, "", false, bank_tab)

quitarleBank_radio = guiCreateRadioButton(256, 233, 146, 15, "Quitarle a su deposito", false, bank_tab)
guiSetFont(quitarleBank_radio, "default-bold-small")

guiSetProperty(quitarleBank_radio, "NormalTextColour", "FFFEF500")
quitarBank_edit = guiCreateEdit(155, 258, 349, 31, "", false, bank_tab)

actBank_radio = guiCreateRadioButton(266, 309, 121, 15, "Actualizar tarjeta", false, bank_tab)
guiSetFont(actBank_radio, "default-bold-small")
guiSetProperty(actBank_radio, "NormalTextColour", "FFFEF500")

normalBank_rad = guiCreateRadioButton(75, 346, 131, 15, "Actualizar a normal", false, bank_tab)
guiSetFont(normalBank_rad, "default-bold-small")
guiSetProperty(normalBank_rad, "NormalTextColour", "FFFD00EE")

goldBank_radio = guiCreateRadioButton(266, 346, 115, 15, "Actualizar a gold ", false, bank_tab)
guiSetFont(goldBank_radio, "default-bold-small")
guiSetProperty(goldBank_radio, "NormalTextColour", "FFFD00EE")

platinumBank_radio = guiCreateRadioButton(443, 346, 142, 15, "Actualizar a platinum", false, bank_tab)
guiSetFont(platinumBank_radio, "default-bold-small")
guiSetProperty(platinumBank_radio, "NormalTextColour", "FFFD00EE")

actBank_button = guiCreateButton(179, 388, 297, 54, "Actualizar", false, bank_tab)
guiSetFont(actBank_button, "default-bold-small")
guiSetProperty(actBank_button, "NormalTextColour", "FF0BFD00")

guiSetVisible(pa_v, false)


bindKey("o", "down", 
	function()
		triggerServerEvent("[SZ]:checkStaff", getLocalPlayer(),getLocalPlayer())
	end
)

function abrir()
	if (guiGetVisible(pa_v) == false) then
		guiSetVisible(pa_v, true)
		showCursor(true)
		for _, player in ipairs(getElementsByType("player")) do
        local row = guiGridListAddRow(player_gridlist)
			guiGridListSetItemText(player_gridlist, row, column, getPlayerName(player), false, false )
			guiGridListSetItemData(player_gridlist, row, column, getPlayerName(player))
		end
	else
		guiGridListClear (player_gridlist)
		guiSetText(name_label, "Name: N/A")
		guiSetText(cuenta_label, "Cuenta: N/A")
		guiSetText(ip_label, "IP: N/A")
		guiSetText(serial_label, "Serial: N/A")
		guiSetText(hp_label, "HP: N/A")
		guiSetText(armor_label, "Armor: N/A")
		guiSetText(dinero_label, "Dinero: N/A")
		guiSetText(skin_label, "Skin ID: N/A")
		guiSetText(team_label, "Team: N/A")
		guiSetText(dim_label, "Dimension: N/A")
		guiSetText(int_label, "Interior: N/A")
		guiSetText(vehicle_label, "Vehicle: N/A")
		guiSetText(vehhp_label, "Vehicle HP: N/A")
		guiSetVisible(pa_v, false)
		showCursor(false)
	end
end
addEvent("[SZAdmin]:abrir", true)
addEventHandler("[SZAdmin]:abrir", getLocalPlayer(), abrir)

addEventHandler("onClientGUIClick", root, 
	function()
		if (source == player_gridlist) then
		local target = guiGridListGetItemText(player_gridlist, guiGridListGetSelectedItem(player_gridlist), 1 )
			if target then
				triggerServerEvent("[SZAdmin]:loadServer", getLocalPlayer(), getLocalPlayer(), target, target)
			end
		end
	end
)

function l0ad(name, acc, ip, serial, hp, armor, dinero, skin, dim, int, team, isVeh, veh, vehhp)
	guiSetText(name_label, "Name: "..name)
	guiSetText(cuenta_label, "Cuenta: "..acc)
	guiSetText(ip_label, "IP: "..ip)
	guiSetText(serial_label, "Serial: "..serial)
	guiSetText(hp_label, "HP: "..hp.."%")
	guiSetText(dinero_label, "Dinero: $"..dinero)
	guiSetText(skin_label, "Skin ID: "..skin)
	guiSetText(dim_label, "Dimension: "..dim)
	guiSetText(int_label, "Interior: "..int)
	--guiSetText(team_label, "Team: "..team)
	--guiSetText(vehhp_label, "Vehicle HP: "..vehhp)
end
addEvent("[SZAdmin]:loadClient", true)
addEventHandler("[SZAdmin]:loadClient", getLocalPlayer(), l0ad)
  
function Refresh () 
	guiGridListClear ( player_gridlist ) 
	for _, player in ipairs(getElementsByType("player")) do 
		guiGridListAddRow(player_gridlist, getPlayerName(player), false, false)
	end
end 
addEventHandler ( "onClientPlayerJoin", getRootElement(), Refresh ) 
addEventHandler ( "onClientPlayerQuit", getRootElement(), Refresh ) 
addEventHandler ( "onClientPlayerChangeNick", getRootElement(), Refresh )

