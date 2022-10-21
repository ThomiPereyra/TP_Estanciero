import Jugador.*

class ListaParticular {
	var property casillero
	var property numero
	const property casilleros = []
	var property listaCasillerosParticular = []
	
	method establecerListaCasillerosParticular(unCasillero,unValor) {
		const lista = self.crearLista() 
		self.setearPrimerCasillero(lista,unCasillero)			
		listaCasillerosParticular = self.acoplarLista(lista,self.crearListaExtra(unValor))
	}
	
	method acoplarLista(unaLista,otraLista) {
		return unaLista + otraLista
	}
	
	method crearListaExtra(unTamanio) {
		const listaExtra = self.crearLista()
		unTamanio.times({listaExtra.agregarCasillero()})
		return listaExtra
	}
	
	method setearPrimerCasillero(unaListaVacia,unCasillero) {
		unaListaVacia.add(unCasillero)
	}
	
	method crearLista() {
		 
		return casilleros.newInstance()
	}
	
	method agregarCasillero(unaLista) {
		unaLista.add(new Casillero())
	}
	
	
}
object tablero {
	const property casilleros = []
	
	method casillerosDesdeHasta(casilleroInicial,unNumero) {
		const listaDefinitiva = new ListaParticular(casillero = casilleroInicial, numero = unNumero)
		return (listaDefinitiva.establecerListaCasillerosParticular(casilleroInicial,unNumero)).listaCasillerosParticular()
	}
	
}




class Casillero {
	method paso(_unJugador){}
		
	method cayo(unJugador){}
	
}

object salida inherits Casillero {
	override method paso(unJugador) {
		unJugador.cobrar(5000)
	}
	
	override method cayo(unJugador) {/* cuando cae en salida no pasa nada*/}
}

object premioGanadero inherits Casillero {
	override method cayo(unJugador) {
		unJugador.cobrar(2500)
	}
	
	override method paso(_unJugador){
		//
	}
	
}
class CasilleroPropiedad inherits Casillero{
	const property precioInicial
	var property duenio = banco
	var property renta
	
	method sosEmpresa()
	
	method suDuenioEs(unPosibleDuenio) {
		return duenio.equals(unPosibleDuenio)
	}
	
	method cambiarDeDuenio(unaPersona) {
		duenio = unaPersona
	}
	
	override method cayo(unJugador) {
		unJugador.caerEnPropiedad()
	}
	
	
	method rentaPara(_unJugador)
	
	
}

class Empresa inherits CasilleroPropiedad {
	
	override method sosEmpresa() {
		return true
	}
	
	override method rentaPara(unJugador) {
		
		unJugador.pagarA(duenio, unJugador.tirarDados() * renta * duenio.cantidadDeEmpresas())
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
	
	
	override method rentaPara(_unJugador) {
		return (2**self.totalDeEstancias()) * rentaFija
	}

}

const prision = new Casillero()