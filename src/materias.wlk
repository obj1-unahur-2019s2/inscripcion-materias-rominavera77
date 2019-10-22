class Materia {
	var property nombre 
	var property cupo 
	var property requisitos = [] 
	var property listaDeEstudiantes = []
	var property listaDeEspera = []
	
	
	
	method inscribirEstudiante(unEstudiante){
		if(self.estaCompleta()){
			listaDeEspera.add(unEstudiante)
		}
		else {listaDeEstudiantes().add(unEstudiante)}
	}

	method estaCompleta(){
	 	return listaDeEstudiantes.size() >= self.cupo()
	}
		
	method darDeBaja(unEstudiante){
		listaDeEstudiantes.remove(unEstudiante)
		if (not listaDeEspera.isEmpty()){
			listaDeEstudiantes.add(listaDeEspera.first())
			listaDeEspera.remove(listaDeEspera.first())
		}
	}	

	method resultadosDeLaInscripcion(){
		self.listaDeEstudiantes({estudiante => estudiante.nombre()})
		self.listaDeEspera({estudiante => estudiante.nombre()})
	}
	
	
}
