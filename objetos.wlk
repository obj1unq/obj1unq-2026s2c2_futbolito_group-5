import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	const objetivo = pelota
	var property camiseta = titular
	
	method image() {
		return "lionel-" + camiseta + ".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method buscar() {
		position = objetivo.position()
	}
	
	method patear() {
		if (position == pelota.position()) {
			pelota.realizarPatear()
	}
}

	method cambiarCamiseta() {
	  if(self.puedeCambiarCamiseta()){
		camiseta = camiseta.otra()
	  }
	  else{
		self.error("no me puedo cambiar acá")
	  }
}


	method puedeCambiarCamiseta() {
	  return (position.x() == 0)
	}
}

object titular {
  method otra() {
	return suplente
  }

}

object suplente {
   method otra() {
	return titular
  }
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method realizarPatear() {
		position = game.at((game.width()-1).min(position.x() + 3), position.y())
	}

	method inicio() {
		position = game.at(0,5)
	}
}
