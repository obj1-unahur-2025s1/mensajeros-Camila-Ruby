import mensajerosYDestinos.*

//Empresa
object empresa {

  const property mensajeros = []
  const property paquetesPendientes = []
  var facturacion = 0
  

  method contratarMensajero(unMensajero){mensajeros.add(unMensajero)}
  
  method despedirMensajero(unMensajero) {mensajeros.remove(unMensajero)}
  
  method despedirATodos() {mensajeros.clear()}
  
  method esGrande() = mensajeros.size() > 2
  
  method primerEmpleadoPuedeEntregar(unPaquete) = 
  mensajeros.first().puedeEntregarPaquete(unPaquete)
  
  method pesoUltimoMensajero() = mensajeros.last().peso()
  
  method tieneSobrepeso() = 
    if (!mensajeros.isEmpty()){
    (mensajeros.sum({m => m.peso()}) / mensajeros.size()) > 500
    }else false
  
  method enviar(unPaquete){
    if(mensajeros.any({m => m.puedeEntregarPaquete(unPaquete)})){
      mensajeros.find({ m => m.puedeEntregarPaquete(unPaquete)}).enviarUnPaquete(unPaquete)
      facturacion += unPaquete.valorEnvio()
    }else{
      paquetesPendientes.add(unPaquete)
    }
    
  }

  method facturacion() = facturacion

  method enviarMuchos(unaListaDePaquetes){
    unaListaDePaquetes.forEach({p => self.enviar(p)})
  }

  method enviarPendienteMasCaro() {
    const caro = paquetesPendientes.max({p => p.valorEnvio()})
    paquetesPendientes.remove(caro)
    self.enviar(caro)
  }
}

//Paquetes
object paqueteOriginal {
  var property estaPago = false
  var property destino = laMatrix
  
  method puedeSerEntregadoPor() {
    const mensajeros = [neo, roberto, chuckNorris]
    return mensajeros.filter({m => m.puedeEntregarPaquete(self)})
    
  }

  method valorEnvio() = 50
  
  method sePuedeEnviarPor(unMensajero) = destino.dejaPasar(unMensajero)
  
  method sePuedeEnviarPorEmpresa() = empresa.mensajeros().all({m => m.puedeEntregarPaquete(self)})
}

object paquetito {
  method estaPago() = true

  method valorEnvio() = 0
  
  method sePuedeEnviarPor(unMensajero) = true
  
  method sePuedeEnviarPorEmpresa() = empresa.mensajeros().all({ m => m.puedeEntregarPaquete(self)})
  
  method puedeSerEntregadoPor() {
    const mensajeros = [neo, roberto, chuckNorris]
    const mensajerosQueSi = mensajeros.filter({m => m.puedeEntregarPaquete(self)})
    return mensajerosQueSi
  }
}

object paquetonViajero {
  const property destinos = [laMatrix, puenteBroockyn]
  var pagoCuota = 0
  
  method estaPago() = self.valorEnvio() == pagoCuota
  
  method valorEnvio() = 100 * destinos.size()
  
  method pagarCuota() {pagoCuota += 100}
  
  method sePuedeEnviarPor(unMensajero) = destinos.all({d => d.dejaPasar(unMensajero)})
  
  method sePuedeEnviarPorEmpresa() = empresa.mensajeros().all({m => m.puedeEntregarPaquete(self)})
  
  method puedeSerEntregadoPor() {
    const mensajeros = [neo, roberto, chuckNorris]
    const mensajerosQueSi = 
    mensajeros.filter({ m => m.puedeEntregarPaquete(self)})
    return mensajerosQueSi
  }
} 

