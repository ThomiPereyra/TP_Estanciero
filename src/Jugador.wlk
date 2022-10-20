import Tablero.CasilleroPropiedad
class Jugador {


	var property dinero = 0
	const property propiedades = #{}
	var property posicion
	var property cantidadDeEmpresas = 0
	
	method cantidadDeEmpresas() {
		return propiedades.sum()
	}
	
	method caerEnPropiedad(unaPropiedad) {
		posicion = unaPropiedad
			
		if(unaPropiedad.suDuenioEs(banco)) {
			self.comprarPropiedad(unaPropiedad)
		}
		if(!unaPropiedad.suDuenioEs(self)) {
			self.abonarRenta(unaPropiedad)		
		}
		
		unaPropiedad.caeAca(self) 
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
		if(unaPropiedad.sosEmpresa()){cantidadDeEmpresas ++}
	}
	
	method construirEstancia(unaEstancia,unCampo) {
		if(dinero >= unCampo.costoConstruccion()){
			unCampo.agregarEstancia(unaEstancia)
			self.pagarPorEstancia(unCampo)
		}
		
	}
	
	method pagarPorEstancia(unCampo) {
		dinero -= unCampo.costoConstruccion()
		self.pagarA(banco,unCampo.costoConstruccion())
	}
	
	method pagarA(alguien,unMonto) {
		alguien.cobrar(unMonto)
	}
	
	method tirarDados() {
		const dado1 = 1.randomUpTo(6.0).roundUp()
		const dado2 = 1.randomUpTo(6.0).roundUp()
		
		return dado1 + dado2
	}
	

}

object banco {
	var property plata
	
	
	method cobrar(unMonto) {
		plata += unMonto
	}

	
}
