class Habitacion {
	var property ocupantes = #{}	
	method confort(persona) { return 10 }
	method puedeEntrar(persona) { 
		return ocupantes.isEmpty() or self.puedeEntrarConGente(persona)
	}
	
	method puedeEntrarConGente(persona)
	
	method estaPresente(persona) = ocupantes.contains(persona)
}

class UsoGeneral inherits Habitacion {
	override method puedeEntrarConGente(persona) = true
}


class Dormitorio inherits Habitacion {
	const duenios = #{}
	
	method registrarDuenio(pers) { duenios.add(pers) }
	override method confort(persona) {
		if (self.esDuenio(persona)) {
			return super(persona) + (10 / duenios.size())
		} else {
			return super(persona) 
		}
	}
	
	override method puedeEntrarConGente(persona) {
		return self.esDuenio(persona) or duenios.all { duenio => self.estaPresente(duenio) }
	}
	
	// me dice si persona es o no uno de mis duenios
	method esDuenio(persona) {
		return duenios.contains(persona)
	}
}


class Banio inherits Habitacion {
	override method confort(persona) {
		return super(persona) + (if (persona.edad() <= 4) 2 else 4)
	}	
	override method puedeEntrarConGente(persona) {
		return ocupantes.any { pers => pers.edad() <= 4 }
	}
}


class Cocina inherits Habitacion {
	var property metrosCuadrados
	
	override method confort(persona) {
		const extra = if (persona.tieneHabilidadesDeCocina()) {
			metrosCuadrados * (valoresHabitaciones.porcentajeConfortCocina() / 100)
		} else {
			0
		}
		return super(persona) + extra
	}	
	override method puedeEntrarConGente(persona) {
		return not persona.tieneHabilidadesDeCocina() 
			or not ocupantes.any { pers => pers.tieneHabilidadesDeCocina() }
	}
}



object valoresHabitaciones {
	var property porcentajeConfortCocina = 10
}