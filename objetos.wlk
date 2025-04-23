//Mensajeros

object roberto{
    var property vehiculo = bicicleta
    method peso() = 70 + vehiculo.peso()
    method puedeLlegarADestino(destino) = destino.dejaPasar(self)
    method puedeLlamar() = false
    method puedeEntregarPaquete(destino) = self.puedeLlegarADestino(destino) && paquete.estaPago()
}

object chuckNorris{
    method peso() = 80
    method puedeLlegarADestino(destino) = destino.dejaPasar(self)
    method puedeLlamar() = true
}

object neo{
    var property credito = true
    method peso() = 0
    method puedeLlegarADestino(destino) = destino.dejaPasar(self)
    method puedeLlamar() = credito
}

//Destinos

object puenteBrockyn {
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

//Paquete
object paquete {
  var property estaPago = true
}