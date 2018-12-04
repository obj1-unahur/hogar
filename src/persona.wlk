class Persona {
	var property edad
	var property tieneHabilidadesDeCocina
	var property habitacionDondeEsta = null
	
	method entrar(habitacion) {
		if (not habitacion.puedeEntrar(self)) {
			self.error("Donde vas amigo??")
		}
		
	}	
	
}
