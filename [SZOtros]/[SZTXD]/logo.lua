function txds()
-----[DFFs]-----
	comisaria = engineLoadDFF ( "dff/comisaria.dff" )

-----[TXDs]-----
	credicoop = engineLoadTXD ( "txd/credicoop.txd" )
	milos = engineLoadTXD ( "txd/milos.txd" )
	kfc = engineLoadTXD ( "txd/kfc.txd" )
	dia = engineLoadTXD ( "txd/dia.txd" )
	bandera = engineLoadTXD ( "txd/bandera.txd" )
	nochup = engineLoadTXD ( "txd/nochup.txd" )
	infinia = engineLoadTXD ( "txd/infinia.txd" )
	ypf = engineLoadTXD ( "txd/ypf.txd" )
	carteles = engineLoadTXD ( "txd/carteles.txd" )
	carteles_banco = engineLoadTXD ( "txd/carteles_banco.txd" )
	
-----[IDs]------
	engineImportTXD ( credicoop, 6873 )
	engineImportTXD ( milos, 7240 )
	engineImportTXD ( kfc, 6907 )
	engineImportTXD ( dia, 7035 )
	engineImportTXD ( bandera, 7092 )
	engineImportTXD ( nochup, 7300 )
	engineImportTXD ( infinia, 3465 )
	engineImportTXD ( ypf, 6909 )
	engineImportTXD ( carteles, 7300 )
	engineImportTXD ( carteles_banco, 14851 )
	engineReplaceModel ( comisaria, 14858 )
end
addEventHandler ( "onClientResourceStart", getRootElement(), txds )