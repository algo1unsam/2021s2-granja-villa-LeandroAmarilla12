import wollok.game.*

class Maiz {
	
	const property position
	var esAdulto = false
	
	method image() {
		const sufijo = if(esAdulto) "adult" else "baby"
		return "corn_" + sufijo + ".png"
	}
	
	method regar(){
		esAdulto = true
	}
	
	method estaLista(){
		return esAdulto
	}
	
	method valor() = 150
}

class Trigo{
	const property position
	var nivel = 0
	var estaListo = false
	
	method image(){
		return "wheat_" + nivel + ".png"
	}
	
	method regar(){
		nivel++
		if(nivel > 3){
			nivel = 0
		}
		if(nivel >= 2){
			estaListo = true
		}
	}
	
	method estaLista() = estaListo
	
	method valor(){
		return (nivel - 1) * 100
	}
}

class Tomaco{
	var property position
	
	method image(){
		return "tomaco.png"
	}
	
	method regar(){
		if(self.position().y() < game.height() - 1){
			position = self.position().up(1)
		}
	}
	
	method estaLista() = true
	
	method valor() = 80
	
}