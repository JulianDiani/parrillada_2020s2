import comidas.*
import comensales.*

object cocina{
	var property platos=[]
	method agregarplatos(comida){
		platos.add(comida)
	}
	method platosVegetarianos(){
		return platos.filter({c=>c.esAptoVegetariano()})
	}
	method platosNoVegetarianos(){
		return platos.filter({c=>not c.esAptoVegetariano()})
	}
	method cantComidasVegetarianas(){
		return platos.filter({c=>c.esAptoVegetariano()}).size()
	}
	method cantComidasNoVegetarianas(){
		return platos.filter({c=>not c.esAptoVegetariano()}).size()
	}
	method tieneBuenaOfertaVegetariana(){
		return self.cantComidasNoVegetarianas()-self.cantComidasVegetarianas()<=2
	}
	method platoFuerteCarnivoro(){
		return self.platosNoVegetarianos().max({p=>p.valoracion()})
	}
	method comidasQueLeGustan(comensal){
		return comensal.comidasQueLeGustan()
	}
	method elegirPlato(comensal){
		if(comensal.comidasQueLeGustan().isEmpty()){
			self.error("no hay ningun plato que le guste")
		}else{
		const platoAComer=comensal.comidasQueLeGustan().anyOne()
		comensal.comer(platoAComer)
		platos.remove(platoAComer)
		
		}
	}
}