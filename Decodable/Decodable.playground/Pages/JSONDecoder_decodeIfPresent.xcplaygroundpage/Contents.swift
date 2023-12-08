//: [Previous](@previous)

import UIKit

// Definición de la estructura User que cumple con el protocolo Decodable.
struct User: Decodable {
    
    // Propiedad que representa el nombre del usuario.
    let name: String
    
    // Propiedad opcional que representa la edad del usuario.
    let age: Int?
  
    // Enumeración que define las claves de codificación para las propiedades.
    enum CodingKeys: String, CodingKey {
        case name
        case age
    }
}

// Extensión de la estructura User para implementar la inicialización desde un decodificador.
extension User {
    
    // Inicializador personalizado para decodificar el objeto User a partir de un decodificador.
    init(from decoder: Decoder) throws {
       
        // Se obtiene el contenedor de valores a partir del decodificador y se especifican las claves de codificación.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Se decodifica y asigna el valor de la propiedad 'name' desde el contenedor.
        self.name = try container.decode(String.self, forKey: .name)
        
        // Se decodifica y asigna el valor opcional de la propiedad 'age' desde el contenedor, permitiendo la ausencia de este valor.
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
    }
}

// Definición de una cadena de datos JSON que representa la información de un usuario.
let jsonData = """
{
    "name": "Matías",
}
""".data(using: .utf8)!

// Intento de decodificación del JSON en un objeto User utilizando un JSONDecoder.
do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    
    // Se accede a la propiedad 'age' del objeto decodificado.
    user.age
} catch {
    // Manejo de errores en caso de que la decodificación falle.
    print("Error: \(error)")
}







//: [Next](@next)
