/** First Wollok example */
object roberto {
	var pesoDeRoberto
	var pesoTotal 
	
	method puedeLLamar() {
		return false
	}
	
	method pesoDeRoberto(unPeso){
		pesoDeRoberto = unPeso
	}
	
	method viajaEnBici(){
		pesoTotal = pesoDeRoberto + 5 
	}
	
	method viajaEncamionConxAcoplados(acoplados){
		pesoTotal = pesoDeRoberto + 500000 *acoplados
	}
	
	method pesoTotal() = pesoTotal
	
	method puedeEntregarPaquete(unPaquete) = unPaquete.estaPago() && unPaquete.destino().all({ destino => destino.mensajeroPuedeLLegar(self)})
	
}

object chuckNorris{
	
	method puedeLLamar() {
		return true
	}
	
	method pesoTotal() = 80
	
	method puedeEntregarPaquete(unPaquete) = unPaquete.estaPago() && unPaquete.destino().all({ destino => destino.mensajeroPuedeLLegar(self)})
	
}

object neo{
	var tieneCredito 
	
	method pesoTotal() = 0
	
	method tieneCredito(booleano) {
		tieneCredito = booleano
	}
	
	method puedeLLamar() {
		return tieneCredito
	}
	
	method puedeEntregarPaquete(unPaquete) = unPaquete.estaPago() && unPaquete.destino().all({ destino => destino.mensajeroPuedeLLegar(self)})
}

object puenteDeBrooklyn{
	
	method mensajeroPuedeLLegar(unMensajero){
		return unMensajero.pesoTotal() < 500000
	}
}

object laMatrix{
	method mensajeroPuedeLLegar(unMensajero){
		return unMensajero.puedeLLamar()
	}
}

object paquete{
	var estaPago
	var destino
	
	method estaPago(booleano){
		estaPago = booleano
	}
	
	method destino(unDestino){
		destino = unDestino
	}
	
	method precio() = 50
	
	method estaPago() = estaPago

	
	method destino() = [destino]
}

object paquetito{
	var destino 
	
	method estaPago() = true
	
	method destino(unDestino){
		destino = unDestino
	}
	
	method precio() = 0
	
	method destino() = [destino]
}

object paqueton{
	var pagosTotal = 0
	const destinos = []
	
	method agregarDestino(destino){
		destinos.add(destino)
	}
	method pagar(){
		pagosTotal += 100
	}	
	
	method precio() = destinos.size() * 100
	
	method estaPago() = pagosTotal == self.precio()
	
	method destino() = destinos
}