import carreras.*
import materias.*

class Estudiante {
	const property aprobaciones = []
	var nombre = "nombre"
	//var materiasInscriptas = []
	const property carreras = []
	
	method registrarAprobacion(materiaAComparar, nota){ 
		 return 
		 if( aprobaciones.all({aprobacion => aprobacion.materia() != materiaAComparar})){
		 	aprobaciones.add(new Aprobacion(materia = aprobacion, nota = nota))
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
		return self.nombreDeMateriasAprobadas().any({apr => apr == materiaAComparar})
	}

	method cantidadDeMateriasAprobadas(){
		return aprobaciones.size()
	}
	
	method promedio(){
		return aprobaciones.sum({aprobacion => aprobacion.nota()})
		/self.cantidadDeMateriasAprobadas()
	}
	
	method materiasInscriptas(){
		return carreras.map({carrera => carrera.materiasDeLaCarrera()}).flatten()
		// flatmap hace todo junto: devuelve una lista con todos los elementos de las dos listas
		// carreras.flatmap({carrera => carrera.materia()})
		}	
		
	method carrerasInscripto(carrera){
		carreras.add(carrera)
	}
	
	method materiasQueTengoQueCursar(){
		return carreras.flatmap({carrera => carrera.materiasDeLaCarrera()})
	}
	
	method materiaEstaEnCarreraQueEstoyCursando(materiaAInscribirse){
		return self.materiasQueTengoQueCursar().any({m => m == materiaAInscribirse})
	}									
	
	method puedeCursar(unaMateria){
		return unaMateria.requisitos().all({materia => self.nombreDeMateriasAprobadas().contains({unaMateria})})
	}
	
	method puedeInscribirse(unaMateria){
		return 	self.materiaEstaEnCarreraQueEstoyCursando(unaMateria) 
				and not self.tieneAprobada(unaMateria) 
				and not self.materiasInscriptas().contains({materia => materia == unaMateria}) 
				and self.puedeCursar(unaMateria)
	}
	
	/*	Determinar si un estudiante puede inscribirse a una materia. Para esto se deben cumplir cuatro condiciones:
    la materia debe corresponder a alguna de las carreras que esté cursando el estudiante,
    el estudiante no puede haber aprobado la materia previamente,
    el estudiante no debe estar estar ya inscripto en esa materia,
    el estudiante debe tener aprobadas todas las materias que se declaran como requisitos de la materia a la que se quiere 
    * inscribir.
    P.ej., para que un estudiante pueda inscribirse a Objetos 2, es necesario tener aprobadas Objetos 1 y Matemática 1.
	*/
	
	
	method inscribirseAUnaMateria(unaMateria){
		if(self.puedeInscribirse(unaMateria)){
			unaMateria.inscribirEstudiante(self)
		}
		else {self.error("Ya esta inscripto")}
	}
	
	method materiasEnLasQueEstoyEnListaDeEspera(unEstudiante){
		self.materiasQueTengoQueCursar().filter({materia =>materia.estoyEnListaDeEspera()})
	}
	
	method estoyEnListaDeEspera(){
		return self.materiasQueTengoQueCursar().listaDeEspera({estudiante => estudiante == self })
	}
	
	method materiasDeLaCarreraQueMePuedoIscribir(carrera){
		if(self.estoyInscripto(carrera)){
			carreras.materiasDeLaCarrera.flatmap({materia => materia.puedeInscribirse()})
		}
	}
	
	
	
}

class Aprobacion {
	var property nota 
	var property materia 
	
}

