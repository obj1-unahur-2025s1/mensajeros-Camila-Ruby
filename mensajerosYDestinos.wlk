import empresaYPaquetes.*
//Mensajeros
object roberto {
  var property vehiculo = bicicleta
  
  method peso() = 90 + vehiculo.peso()
  method puedeLlamar() = false
  method puedeEntregarPaquete(unPaquete) =
  unPaquete.sePuedeEnviarPor(self) && unPaquete.estaPago()
  method enviarUnPaquete(unPaquete) = self.puedeEntregarPaquete(unPaquete)
}

object chuckNorris {
  method peso() = 80
  
  method puedeLlamar() = true
  method puedeEntregarPaquete(unPaquete) = 
  unPaquete.sePuedeEnviarPor(self) && unPaquete.estaPago()
  method enviarUnPaquete(unPaquete) = self.puedeEntregarPaquete(unPaquete)
}

object neo {
  var property credito = true
  
  method peso() = 0
  method puedeLlamar() = credito
  method puedeEntregarPaquete(unPaquete) = 
  unPaquete.sePuedeEnviarPor(self) && unPaquete.estaPago()
  method enviarUnPaquete(unPaquete) = self.puedeEntregarPaquete(unPaquete)
} 

//Destinos
object puenteBroockyn {
  method dejaPasar(mensajero) = mensajero.peso() < 1000
}
object laMatrix {
  method dejaPasar(mensajero) = mensajero.puedeLlamar()
}

//Vehiculos
object bicicleta {
  method peso() = 5
}
object camion {
  var property acoplados = 2
  method peso() = 500 * acoplados
}

