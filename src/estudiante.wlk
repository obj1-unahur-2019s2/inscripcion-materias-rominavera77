import materias.*

class Estudiante {
	var property aprobaciones = []
	var nombre = "nombre"
	
	method registrarAprobacion(aprobacion,nota){ 
		 aprobaciones.add(new Aprobacion (materia = aprobacion, nota = nota))
	}
}



class Aprobacion {
	var property nota 
	var property materia 
	
	
	
}

