import carreras.*

class Estudiante {
	var property aprobaciones = []
	var  property nombre = "nombre"
	var property inscripciones = []
	
	method registrarAprobacion(aprobacion,nota){ 
		 return 
		 if(aprobaciones.contains(aprobacion){
		 	"ERROR"
		 }
		else { aprobaciones.add(new Aprobacion (materia = aprobacion, nota = nota))}	
	}
	
	method tieneAprobada(materia){
		return aprobaciones.any({aprobacion => aprobacion == materia})
	}
	
	method cantidadDeMateriasAprobadas(){
		return aprobaciones.size()
	}
	
	method promedio(){
		return aprobaciones.sum({aprobacion => aprobacion.nota()})
		/self.cantidadDeMateriasAprobadas()
	}
	
	method materiasInscriptas(){
		return inscripciones.flatten()
	}	
}



class Aprobacion {
	var property nota 
	var property materia 
	
	
	
}

