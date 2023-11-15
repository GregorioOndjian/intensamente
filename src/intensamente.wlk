object riley{ 
	var felicidad = 1000
	var property emocionDominanteRiley = alegria 
	var diaActual = 1
	var recuerdosDelDia = []
	
	var recuerdosCentrales = #{}
	
	method agarrarRecuerdo(n) = recuerdosDelDia.get(n-1)
	
	method vivirEvento(descripcionRecuerdo) {
		recuerdosDelDia.add(new Recuerdo(emocionDominante = emocionDominanteRiley, descripcion = descripcionRecuerdo, fecha = diaActual ))
	}
	
	method modificarFelicidad(coeficiente){
		felicidad = felicidad * coeficiente
		if(felicidad < 1){
			throw new DomainException(message = "Felicidad muy baja")
		}
	}
	
	method recuerdosRecientes(){
		recuerdosDelDia.take(5)
	}
	
	method pensamientosCentrales() = recuerdosCentrales
	
	method asentarRecuerdo(recuerdo){
		recuerdo.asentar()
	}
	
	method agregarPensamientoCentral(recuerdo){
		recuerdosCentrales.add(recuerdo)
	}
	

	method muyFeliz() = felicidad > 500
}


class Recuerdo{
	
	var emocionDominante 
	var fecha
	var descripcion
	
	method asentar(){
		emocionDominante.asentarse(self)
	}
}


class Emocion{
	method asentarse(recuerdo)
	
	method negar() = "#"
}

object alegria inherits Emocion {
	override method asentarse(recuerdo){
		if(riley.muyFeliz()){
			riley.agregarPensamientoCentral(recuerdo)
		}
	}
}
object tristeza inherits Emocion {
	override method asentarse(recuerdo){
		riley.agregarPensamientoCentral(recuerdo)
		riley.modificarFelicidad(0.1)
	}
}