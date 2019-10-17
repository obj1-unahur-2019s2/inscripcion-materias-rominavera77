import carreras.*
import materias.*

class Estudiante {
	var aprobaciones = []
	var nombre = "nombre"
	var materiasInscriptas = []
	var property carreras = []
	
	method registrarAprobacion(materiaAComparar, nota){ 
		 return 
		 if( aprobaciones.all({aprobacion => aprobacion.materia() != materiaAComparar})){
		 	aprobaciones.add(new Aprobacion (materia = aprobacion, nota = nota))
		 }
		 else {self.error("Ya esta aprobada")}
		 
		 
		 //if(aprobaciones.contains(aprobacion)){
		 	//self.error("Error")
		// }
		//else { aprobaciones.add(new Aprobacion (materia = aprobacion, nota = nota))}	
	}
	
	method nombreDeMateriasAprobadas(){
		return aprobaciones.map({aprobacion => aprobacion.materia()})
	}
	
	method tieneAprobada(materiaAComparar){
		return self.nombreDeMateriasAprobadas().any({a => a == materiaAComparar})
	}

	method cantidadDeMateriasAprobadas(){
		return aprobaciones.size()
	}
	
	method promedio(){
		return aprobaciones.sum({aprobacion => aprobacion.nota()})
		/self.cantidadDeMateriasAprobadas()
	}
	
	method materiasInscriptas(){
		return carreras.map({carrera => carrera.materia()}).flatten()
		// flatmap hace todo junto: devuelve una lista con todos los elementos de las dos listas
		// carreras.flatmap({carrera => carrera.materia()})
		}	
		
	method carrerasInscripto(carrera){
		carreras.add(carrera)
	}
	
	method nombreDeMateriasQueTieneQueCursar(){
		return carreras.flatmap({carrera => carrera.materia()})
	}
	
	method materiaEstaEnCarreraQueEstoyCursando(materiaAInscribirse){
		self.nombreDeMateriasQueTieneQueCursar().any({m => m == materiaAInscribirse})
	}									
	
	method puedeCursar(unaMateria){
		return unaMateria.requisitos().all({materia => self.nombreDeMateriasAprobadas().contains({unaMateria})})
	}
	
	method puedeInscribirse(unaMateria){
	/*
	Determinar si un estudiante puede inscribirse a una materia. Para esto se deben cumplir cuatro condiciones:

    la materia debe corresponder a alguna de las carreras que esté cursando el estudiante,
    el estudiante no puede haber aprobado la materia previamente,
    el estudiante no debe estar estar ya inscripto en esa materia,
    el estudiante debe tener aprobadas todas las materias que se declaran como requisitos de la materia a la que se quiere 
    * inscribir.
    P.ej., para que un estudiante pueda inscribirse a Objetos 2, es necesario tener aprobadas Objetos 1 y Matemática 1.
	*/
		
		return 	self.materiaEstaEnCarreraQueEstoyCursando(unaMateria) and
			 	not self.tieneAprobada(unaMateria) and
			 	not self.materiasInscriptas().contains({materia => materia == unaMateria}) and
			 	self.puedeCursar(unaMateria)
	}
	
	method inscribirseAUnaMateria(unaMateria){
		if(self.puedeInscribirse(unaMateria)){
			unaMateria.inscribirEstudiante(self)
		}
		else {self.error("Ya esta inscripto")}
	}
	
	
	
	/*Inscribir un estudiante a una materia, verificando las condiciones de inscripción de la materia. 
	 * Si no se cumplen las condiciones, lanzar un error.
	Además, cada materia tiene un “cupo”, es decir, una cantidad máxima de estudiantes que se pueden inscribir. 
	* Para manejar el exceso en los cupos, las materias tienen una lista de espera, de estudiantes que quisieran 
	* cursar pero no tienen lugar (ver punto 5). 
	* O sea, como resultado de la inscripción, el estudiante puede, o bien quedar confirmado, o bien quedar en lista de espera.
	No se requiere que el sistema conteste nada con respecto al resultado de la inscripción. */

}







class Aprobacion {
	var property nota 
	var property materia 
	
	
	
}

