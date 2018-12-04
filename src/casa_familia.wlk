class Casa {
	var property habitaciones = #{}		
	
	method habitacionesOcupadas() = habitaciones.filter { hab => hab.estaOcupada() }
	
	method responsables() = self.habitacionesOcupadas().map { hab => hab.ocupanteMasViejo() }
}


class Familia {
	var property integrantes = #{}
	var property casaDondeVive
	
	method nivelConfortPromedio() { 
		return integrantes.sum { int => int.nivelConfortTotal(casaDondeVive) } / integrantes.size()
	}
	
	method estaAGusto() {
		return self.nivelConfortPromedio() > 40
			and integrantes.all { pers => pers.seSienteAGusto(casaDondeVive, self) }
	}
}
