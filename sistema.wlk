import usuarios.*

object sistema { //WELL KNOWN OBJECT - WKO
    var usuarios = []
    var ganancias = 0

    method registrarUsuario(nombre, metodoDePago){
        self.agregarUsuario(new Usuario(nombre = nombre, metodoDePago = metodoDePago))
    }

    method ganancias() = ganancias

    method cuantosUsuariosLesGusta(pizza) = usuarios.count({usuario => usuario.tieneFavorita(pizza)})
    
    method agregarUsuario(usuario){
        usuarios.add(usuario)
    }

    method regalarCrazyPizzaPoints() {
        usuarios.forEach({usuario => usuario.sumarPuntos(100)})
    }

    method nombresRegistrados() = usuarios.map({usuario => usuario.nombre()})

    method premiarPizzaficionados() {
        self.pizzaficionados().forEach({pizzaficionado => pizzaficionado.ganarPremio()})
    }

    method pizzaficionados() = usuarios.filter({usuario => usuario.esPizzaficionado()})

    //sistema.venderPizza(usuario, pizza)
    method venderPizza(usuario, pizza){
        if(!usuarios.contains(usuario)){
            throw new DomainException(message="No se puede vender a un usuario que no conozco")
        }
        
        usuario.comprarPizza(pizza)
        ganancias += pizza.precio()
    }
}