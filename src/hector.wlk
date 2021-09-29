import wollok.game.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	const cosechasAVender =[]
	var monedas = 0
	
	method sembrarMaiz(){
		game.addVisual(new Maiz(position = position)
	}
	
	method sembrarTrigo(){
		game.addVisual(new Trigo(position = position))
	}
	
	method sembrarTomaco(){
		game.addVisual(new Tomaco(position = position))
	}
	
	
	
	method regarCultivosDebajo(){
		const cultivosDebajo  = self.cultivosDebajo("regar")
		cultivosDebajo.forEach({cultivo => cultivo.regar()})
	}
	
	method cosecharCultivosDebajo(){
		const cultivosDebajo = self.cultivosDebajo("cosechar")
		const cultivosListos = cultivosDebajo.filter({cultivo => cultivo.estaLista()})
		cosechasAVender.addAll(cultivosListos)
		cultivosListos.forEach({cosecha => game.removeVisual(cosecha)})
	}
	
	
	method cultivosDebajo(mensaje){
		const cultivosDebajo = game.colliders(self)
		if(cultivosDebajo.isEmpty()){
			self.error("No hay cultivos para " + mensaje)
		}
		return cultivosDebajo
	}
	
	method vender(){
		monedas += cosechasAVender.sum({cosecha => cosecha.valor()})
		cosechasAVender.clear()
	}
	
	
	method consultaEconomia(){
		game.say(self,"tengo " + monedas + " y tengo " + cosechasAVender.size() + " cosechas para vender")
	}
	
}