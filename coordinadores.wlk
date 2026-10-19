class Coordinador {
    var cantidadDeViajes 
    var añosDeExperiencia
    var rol
    var estaMotivado
    var rolesDisponibles = [guia, asistenteLogistico, acompañante]
    method cantidadDeViajes() = cantidadDeViajes
    method estaMotivado() = estaMotivado
    method añosDeExperiencia() = añosDeExperiencia
    method rol() = rol   
    method cambiarRolA(rolNuevo) {
        if(self.estaDisponible(rolNuevo)) {
            self.cambiarARolNuevo(rolNuevo)
        } else {
            return throw new Exception(message = "El rol seleccionado no existe")
        }
    } 
    method estaDisponible(rolNuevo) = rolesDisponibles.contains(rolNuevo) 
    method cambiarARolNuevo(rolNuevo) {rol = rolNuevo}
    method tieneMasViajesQue(cantidad) = cantidadDeViajes > cantidad
    method esAltamenteCalificado() {
        if(self.tieneMasViajesQue(20)) {
            return rol.cumpleBienElRol(self)
        } else {
            return false
        }
    } 
}
 
const coordinador1 = new Coordinador(cantidadDeViajes = 2, añosDeExperiencia = 3, rol = "Guia",estaMotivado = true)

object guia {
  method cumpleBienElRol(coordinador) = coordinador.estaMotivado()  
}

object asistenteLogistico {
    method cumpleBienElRol(coordinador) = coordinador.añosDeExperiencia() >= 3
}

object acompañante {
    method cumpleBienElRol(coordinador) = true
}
//la agencia puede cambiarle el rol(guia,asistente logistico, acompañante) si asigna un rol no existente el programa lanza una excepciocantidan