import Tablero.CasilleroPropiedad
class Jugador {
	//PRUEBA DE COMMIT
	//prueba segundo commit
	var property dinero = 0
	const property propiedades = #{}
	var property posicion
	
	method caerEnPropiedad(unaPropiedad) {
		posicion = unaPropiedad
		if(unaPropiedad.suDuenioEs(banco)) {
			self.comprarPropiedad(unaPropiedad)
		}
		if(!unaPropiedad.suDuenioEs(self)) {
			self.abonarRenta(unaPropiedad)		
		}
	}
	
	method abonarRenta(unaPropiedad) {
		dinero -= unaPropiedad.renta()
	}
	
	method comprarPropiedad(unaPropiedad) {
		if(dinero >= unaPropiedad.precioInicial()) {
			dinero -= unaPropiedad.precioInicial()
			self.adquirirPropiedad(unaPropiedad)
			unaPropiedad.cambiarDeDuenio(self) }
			else { throw new Exception(message = "No te alcanza la plata!")}
	}
	
	method adquirirPropiedad(unaPropiedad) {
		propiedades.add(unaPropiedad)
	}
	
	method construirEstancia(unaEstancia,unCampo) {
		if(dinero >= unCampo.costoConstruccion()){
			unCampo.agregarEstancia(unaEstancia)
			self.pagarPorEstancia(unCampo)
		}
		
	}
	
	method pagarPorEstancia(unCampo) {
		dinero -= unCampo.costoConstruccion()
		self.pagarABanco(unCampo.costoConstruccion())
	}
	
	method pagarABanco(unMonto) {
		banco.cobrar(unMonto)
	}

}

object banco {
	var property plata
	
	
	method cobrar(unMonto) {
		plata += unMonto
	}

	
}
