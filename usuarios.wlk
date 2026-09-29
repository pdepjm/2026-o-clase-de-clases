import pizzas.*
import premios.*

class Usuario {
    var pizzasFavoritas = []
    const property nombre
    var crazyPizzaPoints = 0
    var premios = []

    method agregarPizzaFavorita(pizza){
        pizzasFavoritas.add(pizza)
    }

    method tieneFavorita(pizza) = pizzasFavoritas.contains(pizza)

    method comprarPizza(pizza){
        crazyPizzaPoints += pizza.precio() / 100
    }

    method sumarPuntos(puntos){
        crazyPizzaPoints += puntos
    }

    method esPizzaficionado() = crazyPizzaPoints > 1000
    
    method ganarUnPremio(){
        premios.add(new Premio(ganador = self, anio = new Date().year()))
    }

    method esClasico() = premios.any({premio => premio.esViejo()})

}