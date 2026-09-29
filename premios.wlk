class Premio {
    const ganador
    const anio

    method textoConmemorativo() = ganador.nombre() + " ganó el premio pizza loca en el año " + anio

    method esViejo() = anio < 2020
}