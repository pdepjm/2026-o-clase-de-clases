import pizzas.*
import premios.*

class Usuario {
    var pizzasFavoritas = []
    const property nombre
    var crazyPizzaPoints = 0
    var premios = []
    var metodoDePago = pdePay

    method agregarPizzaFavorita(pizza){
        pizzasFavoritas.add(pizza)
    }

    method tieneFavorita(pizza) = pizzasFavoritas.contains(pizza)

    method comprarPizza(pizza){
        metodoDePago.pagar(pizza.precio())
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

object pdePay{
    method pagar(precio) {}
}

class TarjetaDeCredito {
    const limite
    var deuda = 0

    method pagar(precio){
        if(precio > limite - deuda){
            throw new DomainException(message="No alcanza el limite de la tarjeta")
        }
        deuda += precio
    }
}

class TarjetaDeDebito {
    var saldo

    method pagar(precio){
        if(precio > saldo){
            throw new DomainException(message="No te alcanza el saldo")
        }
        saldo -= precio
    }
}

