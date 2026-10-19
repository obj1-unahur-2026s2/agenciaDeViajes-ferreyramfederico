class BeneficiosOpcionales {
    var tipo 
    var costo  
    var estaVigente 
    method tipo() = tipo
    method costo() = costo
    method estaVigente() = estaVigente
}

const beneficiosOpcionales1 = new BeneficiosOpcionales(tipo = "Traslados privados", costo = 10, estaVigente = true)
const beneficiosOpcionales2 = new BeneficiosOpcionales(tipo = "Acceso a salas VIP", costo = 15, estaVigente = true)
