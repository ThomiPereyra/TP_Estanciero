import Tablero.*
class Provincia {
	var property campos = #{}
	
	///// validaciones para la construccion de estancias
	method permiteConstruirEn(unCampo){
		return self.esMonopolio() and self.construccionPareja(unCampo)
	}
	
	method esMonopolio() {
		return self.camposTienenMismoDuenio()
	}
	
	method camposTienenMismoDuenio() {
		return campos.all({unCampo, otroCampo => unCampo.duenio() == otroCampo.duenio()})
	}
	
	method construccionPareja(unCampo) {
		return campos.all({otroCampo => unCampo.totalDeEstancias() <= otroCampo.totalDeEstancias()})
	}
	
	/////////////////
	
	method duenios() {
		return campos.all({unCampo => unCampo.duenio()})
	}
}