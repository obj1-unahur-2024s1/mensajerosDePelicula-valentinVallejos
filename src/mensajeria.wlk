import mensajerosYDestinos.*
object mensajeria {
	const mensajeros = []
	var recaudaciones = 0
	const paquetesPendientes = []
	
	method contratarMesanjero(unMensajero){
		mensajeros.add(unMensajero)
	}
	
	method despedirMensajero(unMensajero){
		mensajeros.remove(unMensajero)
	}
	
	method despedirATodosLosMensajeros(){
		mensajeros.clear()
	}
	
	method esGrande() = mensajeros.size() > 2
	
	method elPrimeroPuedeEntregarElPaquete(unPaquete) = mensajeros.first().puedeEntregarPaquete(unPaquete)
	
	method pesoDelUltimo() = mensajeros.last().pesoTotal()
	
	method alguienPuendeEntregarElPaquete(unPaquete) = mensajeros.any({ mensajero => mensajero.puedeEntregarPaquete(unPaquete) })
	
	method quienesPuedenEntregarElPaquete(unPaquete) = mensajeros.filter({ mensajero => mensajero.puedeEntregarPaquete(unPaquete) })
	
	method mensajeriaConSobrePeso() = ( mensajeros.sum({x => x.pesoTotal()}) / mensajeros.size() ) > 500
	
	method recaudaciones() = recaudaciones
	
	method paquetesPendientes() = paquetesPendientes
	
	method enviarPaquete(unPaquete) {
		if (self.alguienPuendeEntregarElPaquete(unPaquete)){
			recaudaciones += unPaquete.precio()
		}else{
			paquetesPendientes.add(unPaquete)
		}
	}
	
	method enviarPaquetes(paquetes) {
		paquetes.forEach( {unPaquete => self.enviarPaquete(unPaquete)}  )
	}
	
	method enviarPendienteMasCaro(){
		const pendienteMasCaro = paquetesPendientes.max( {x => x.precio()} )
		if ( self.alguienPuendeEntregarElPaquete( pendienteMasCaro )  ) {
			recaudaciones += pendienteMasCaro.precio()
			paquetesPendientes.remove(pendienteMasCaro)
			}
		
	}
		
		

	
}
