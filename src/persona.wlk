class Persona {
	var property edad
	var property tieneHabilidadesDeCocina
	var property habitacionDondeEsta = null
	
	method entrar(habitacion) {
		if (not habitacion.puedeEntrar(self)) {
			self.error("Donde vas amigo??")
		}
		
	}	
	
	method nivelConfortTotal(casa) = casa.habitaciones().sum { hab => hab.confort(self) }	
}


class Obsesive inherits Persona {
	method seSienteAGusto(casa, familia) {
		return casa.habitaciones().any { hab => hab.puedeEntrar(self) }
		and casa.habitaciones().all { hab => hab.ocupantes().size() <= 2 }
	}
}

 