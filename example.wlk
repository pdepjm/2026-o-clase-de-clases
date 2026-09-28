object pizzaMuzza {
  method precio() = 20000
  method esVegetariana() = true
}
object pizzaNapolitana {
  method precio() = 24000
  method esVegetariana() = true
}
object pizzaMuzzaConPepperoni {
  method precio() = 24000
  method esVegetariana() = false
}
object pizzaJamonYMorron {
  method precio() = 25000
  method esVegetariana() = false
}


class Usuario{
  const pizzasFavoritas = []
  var crazyPizzaPoints = 0 
  const premios = []
  var nombre

  method agregarPizzaFavorita(nuevaPizza){
    pizzasFavoritas.add(nuevaPizza)
  }

  method pizzasFavoritas() =pizzasFavoritas

  method leGusta(tipoDePizza) = pizzasFavoritas.contains(tipoDePizza)

  method comprar(tipoDePizza){
    crazyPizzaPoints =+ tipoDePizza.precio() / 100
  }

  method points() = crazyPizzaPoints

  method sumarPuntos(puntos){
    crazyPizzaPoints += puntos
  }

  method nombre() = nombre

  method esPizzaAficionado() = crazyPizzaPoints > 1000

  method obtenerPremio() {
    const añoActual = (new Date()).year()
    const nuevoPremio = new Premio(usuario = self, año = añoActual)
    premios.add(nuevoPremio)
  }

  method premios() = premios
}

class Premio {
  const usuario
  const año

  method textoConmemorativo() = usuario.nombre() + " ganó el premio pizza loca en el año " + año
  method esViejo() = año < 2020 
}

object sistemaDeUsuarios {
  const usuariosRegistrados = []

  method registrar(nombre){
    const nuevoUsuario = new Usuario(nombre = nombre)
    usuariosRegistrados.add(nuevoUsuario)
  }

  method aCuantosLesGusta(tipoDePizza) = 
    usuariosRegistrados.filter({usuario => usuario.leGusta(tipoDePizza)}).size()

  method sumarCrazyPoints() {
    usuariosRegistrados.forEach({usuario => usuario.sumarPuntos(100)})
  }

  method nombresDeUsuarios() = usuariosRegistrados.map({usuario => usuario.nombre()})

  method darPremios(){
    const aficionados = usuariosRegistrados.filter({usuario => usuario.esPizzaAficionado()})
    aficionados.forEach({aficionado => aficionado.obtenerPremio()})
  }
}