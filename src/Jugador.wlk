import Tablero.*
class Entidades {
	var property dinero
	var property cantidadDeEmpresas = 0
	
	method pagarA(alguien,unMonto) {
		alguien.cobrar(unMonto)
		dinero -= unMonto
	}
	
	method cobrar(unMonto) {
		dinero += unMonto
	}
}


class Jugador inherits Entidades {

	const property propiedades = #{}
	var property posicion
	
	
	method caerEnPropiedad(unaPropiedad) {
		posicion = unaPropiedad
			
		if(unaPropiedad.suDuenioEs(banco)) {
			self.comprarPropiedad(unaPropiedad)}
			
		if(!unaPropiedad.suDuenioEs(self)) {
			self.abonarRenta(unaPropiedad)}
		
		unaPropiedad.rentaPara(self) 
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
	

	
	method tirarDados() {
		const dado1 = 1.randomUpTo(6.0).roundUp()
		const dado2 = 1.randomUpTo(6.0).roundUp()
		
		return dado1 + dado2
	}
	
	method moverseSobre(casilleros) {
		const ultimo = casilleros.last() 
		
		casilleros.forEach({ unCasillero => unCasillero.paso(self) })
		ultimo.cayo(self)
		posicion = ultimo		
	}
	

}

object banco inherits Entidades(dinero = 1000000){
	override method pagarA(unJugador,unMonto) {
		self.validarPago(unMonto)
		super(unJugador,unMonto)
	}
	
	method validarPago(unaCantidad) {
		if(unaCantidad > dinero) {
			throw new Exception(message = "el banco no te puede pagar")
		}
	}

}
