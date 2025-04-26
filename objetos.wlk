//Mensajeros

object roberto{
    var property vehiculo = bicicleta
    method peso() = 90 + vehiculo.peso()
    method puedeLlegarADestino(destino) = destino.dejaPasar(self)
    method puedeLlamar() = false
    method puedeEntregarPaquete(unPaquete) = 
    self.puedeLlegarADestino(unPaquete.destino()) && unPaquete.estaPago()
}

object chuckNorris{
    method peso() = 80
    method puedeLlegarADestino(destino) = destino.dejaPasar(self)
    method puedeLlamar() = true
    method puedeEntregarPaquete(unPaquete) = 
    self.puedeLlegarADestino(unPaquete.destino()) && unPaquete.estaPago()
}

object neo{
    var property credito = true
    method peso() = 0
    method puedeLlegarADestino(destino) = destino.dejaPasar(self)
    method puedeLlamar() = credito
    method puedeEntregarPaquete( unPaquete) = 
    self.puedeLlegarADestino(unPaquete.destino()) && unPaquete.estaPago()
}

//Destinos

object puenteBroockyn {
  method dejaPasar(mensajero) = mensajero.peso() < 1000
}

object laMatrix {
  method dejaPasar(mensajero) = mensajero.puedeLlamar()
}

object destinoDePaquetito {
  method dejaPasar(mensajero) = true
}

//Vehiculos

object bicicleta {
  method peso() = 5
}

object camion {
  var property acoplados = 2
  method peso() = 500 * acoplados
}

//Paquetes
object paqueteOriginal {
  var property estaPago = false
  var property destino = laMatrix
  method valorEnvio() = 50
}

object paquetito {
  method estaPago() = true
  var property destino = destinoDePaquetito
 
}

object paquetonViajero {
  var property destinos = [laMatrix, puenteBroockyn]
  var pagoCuota = 0
  method destino() = destinos
  method estaPago() = self.valorEnvio() == pagoCuota
  method valorEnvio() = 100
  method pagoCuota(unValor) {
    pagoCuota += unValor
  }
  method pagoCuota() = pagoCuota

}


//Empresa
object empresa {
  const property mensajeros = []
  method contratarMensajero(unMensajero){
    mensajeros.add(unMensajero)
  }
  method despedirMensajero(unMensajero){
    mensajeros.remove(unMensajero)
  }
  method despedirATodos(){
    mensajeros.clear()
  } 
  method esGrande() = mensajeros.size() > 2

  method primerEmpleadoPuedeEntregar(unPaquete) =
  mensajeros.first().puedeEntregarPaquete(unPaquete) 

  method pesoUltimoMensajero() = 
  mensajeros.last().peso()


}