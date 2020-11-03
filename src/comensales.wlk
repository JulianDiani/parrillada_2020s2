import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	var property comidasQueLeGustan=[]
	method comer(comida){
		comidas.add(comida)

		if(self.leAgrada(comida)){comidasQueLeGustan.add(comida)}
	}
	method leAgrada(unaComida)
	
	method satisfecho(){
		return comidas.sum({c=>c.peso()})>=self.peso()*0.01
	}
}
class Vegetariano inherits Comensal{
	override method leAgrada(unaComida){
		return unaComida.esAptoVegetariano() && unaComida.valoracion()>85
	}
	override method satisfecho(){
		return super()&& not comidas.any({c=>c.esAbundante()})
	}
}
class HambrePopular inherits Comensal{
	override method leAgrada(unaComida){
		return unaComida.esAbundante()
	}
}
class DePaladarFino inherits Comensal{
	override method leAgrada(unaComida){
		return unaComida.peso().between(150,300)&&unaComida.valoracion()>100
	}
	override method satisfecho(){
		return super() && comidas.size().even()
	}
}