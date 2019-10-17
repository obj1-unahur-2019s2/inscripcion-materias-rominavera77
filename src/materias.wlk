class Materia {
	var property nombre = nombre
	var property requisitos = []
	var property cupo 
	const listaDeEstudiantes = []
	const listaDeEspera = []
	
	method inscribirEstudiante(unEstudiante){
		if(self.listaDeEstudiantes().size() >= cupo()){
			listaDeEspera.add(estudiante)
		}
		else {listaDeEstudiantes.add(unEstudiante)}
	}
		
	method darDeBaja(unEstudiante){
		listaDeEstudiantes.remove(unEstudiante)
	}	
		
	
}
