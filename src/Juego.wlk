import Tablero.*
class Juego {
	const jugadores = #{}
	
	method empezar() {
		if(!self.estaTerminado()) {
			jugadores.forEach({unJugador => self.queJuegue(unJugador)})
		}
	}
	
	method estaTerminado(){
		return false
	}
	
	method queJuegue(unJugador) {
		const resultado = unJugador.tirarDados()
		const listaDondeMoverse = tablero.casillerosDesdeHasta(unJugador.posicion(),resultado)
		unJugador.moverseSobre(listaDondeMoverse)
	}
}
