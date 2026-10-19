import coordinadores.*
import beneficiosEspeciales.*

  class Packs {
    var diasDeDuracion 
    var precioBase
    const beneficiosEspeciales = []
    var coordinadorACargo
    method diasDeDuracion() = diasDeDuracion
    method precioBase() = precioBase
    method beneficiosEspeciales() = beneficiosEspeciales
    method coordinadorACargo() = coordinadorACargo   
    method valorFinal() = precioBase + self.sumaDeCostosDeBeneficios()
    method sumaDeCostosDeBeneficios() = beneficiosEspeciales.sum({b => b.costo()})
    method agregarBeneficioEspecial(beneficio) {beneficiosEspeciales.add(beneficio)}
    method esPremium()   
  }

  class PacksNacionales inherits Packs {
    var provinciaDestino    
    const actividadesIncluidas = [] //Las actividades son strings   
    method provinciaDestino() = provinciaDestino
    method actividadesIncluidas() = actividadesIncluidas   
    override method esPremium() = diasDeDuracion > 10 and coordinadorACargo.esAltamenteCalificado()
  }

  class PacksInternacionales inherits Packs {
    var paisDestino 
    var cantidadDeEscalas
    var esLugarDeInteres
    method paisDestino() = paisDestino
    method cantidadDeEscalas() = cantidadDeEscalas
    method esLugarDeInteres() = esLugarDeInteres  
    override method valorFinal() = super() + super() * 0.20
    override method esPremium() = esLugarDeInteres and diasDeDuracion > 20 and cantidadDeEscalas == 0
  }

  class PacksProvinciales inherits PacksNacionales {
    var cantidadDeCiudades
    override method esPremium() = actividadesIncluidas.size() >= 4 and cantidadDeCiudades > 5 and beneficiosEspeciales.size() >= 3
    override method valorFinal() {
      if (self.esPremium()) {
        return super() + super() * 0.05
      } else {
        return super()
      }
    }
  }


const pack1 = new PacksNacionales(diasDeDuracion = 3,precioBase = 3,coordinadorACargo = coordinador1,provinciaDestino = "Mendoza")
const pack2 = new PacksInternacionales(diasDeDuracion = 3,precioBase = 100,coordinadorACargo = coordinador1, paisDestino = "Islandia", cantidadDeEscalas = 3, esLugarDeInteres = true)