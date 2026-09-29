import usuarios.*

object sistema { //WELL KNOWN OBJECT - WKO
    var usuarios = []

    method registrarUsuario(nombre){
        usuarios.add(new Usuario(nombre = nombre))
    }

    method cuantosUsuariosLesGusta(pizza) = usuarios.count({usuario => usuario.tieneFavorita(pizza)})
    
    //sistema.regalarCrazyPizzaPoints()

    method regalarCrazyPizzaPoints() {
        usuarios.forEach({usuario => usuario.sumarPuntos(100)})
    }

    method nombresRegistrados() = usuarios.map({usuario => usuario.nombre()})

    method premiarPizzaficionados() {
        self.pizzaficionados().forEach({pizzaficionado => pizzaficionado.ganarPremio()})
    }

    method pizzaficionados() = usuarios.filter({usuario => usuario.esPizzaficionado()})

}