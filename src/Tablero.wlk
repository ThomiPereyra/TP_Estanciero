import Jugador.banco

object tablero {
	const property casilleros = #{}
	// PRUEBA commit
}
class CasilleroPropiedad {
	const property precioInicial
	var property duenio = banco
	var property renta
	
	method suDuenioEs(unPosibleDuenio) {
		return duenio.equals(unPosibleDuenio)
	}
	
	method cambiarDeDuenio(unaPersona) {
		duenio = unaPersona
	}
	
	method sosEmpresa()
	
}

class Empresa inherits CasilleroPropiedad {
	
	override method sosEmpresa() {
		return true
	}
	
}

class Campo inherits CasilleroPropiedad {
	const provincia 
	const property rentaFija
	var property costoConstruccion
	const property estancias = []
	
	override method sosEmpresa() {
		return false
	}
	
	method perteneceA() {
		return provincia
	}
	
	method agregarEstancia(unaEstancia) {
		if(provincia.permiteConstruirEn(self)) {
			estancias.add(unaEstancia)
		} else {
			throw new Exception(message = "No se puede agregar una Estancia!")
		}
	}
	
	
	method totalDeEstancias() {
		return estancias.size()
	}
	
	
	method rentaSegunCantDeEstancias() {
		return (2**self.totalDeEstancias()) * rentaFija
	}

}