class Comida {
	var property peso=0
	method esAptoVegetariano()
	method valoracion()
		
	method esAbundante(){
		return peso>250
	} 
}
class Provoleta inherits Comida{
	var property tieneEspecias
	override method esAptoVegetariano(){
		return not tieneEspecias 
	}
	method esEspecial(){
		return self.esAbundante() || self.tieneEspecias()
	}
	override method valoracion(){
		return if(self.esEspecial()){120}else{80}
	}
}
class HamburguesaDeCarne inherits Comida{
	var panSeteado
	override method peso(){
		return 250
	}
	override method esAptoVegetariano(){
		return false
	}
	method configPan(pan){
		panSeteado=pan
	}
	override method valoracion(){
		return 60+panSeteado.puntos()
	}
	
}
object panIndustrial{
	method puntos(){return 0}
}
object panCasero{
	method puntos(){return 20}
}
object panDeMasaMadre{
	method puntos(){return 45}
}
class HamburguesaVegetariana inherits HamburguesaDeCarne{
	var property legumbreDeLaQueEstaHecha=""
	override method esAptoVegetariano(){
		return true
	}
	override method valoracion(){
		return super()+17.min(2*legumbreDeLaQueEstaHecha.size())
	}	

}
class Parrillada inherits Comida{
	var property cortesDeCarnePedidos=[]
	method agregarCortesDeCarne(corte){
		cortesDeCarnePedidos.add(corte)
	}
	override method peso(){
		return cortesDeCarnePedidos.sum({c=>c.peso()})
	}
	override method esAptoVegetariano(){
		return false
	}
	method calidadMasAltaDeLosCortes(){
		return cortesDeCarnePedidos.map({c=>c.calidad()}).max()
	}
	method cantidadDeCortes(){
		return cortesDeCarnePedidos.size()
	}
	override method valoracion(){
		return 0.max(15*self.calidadMasAltaDeLosCortes()-self.cantidadDeCortes())
	}
}
class Corte{
	var property peso=0
	var property calidad=0
	
}