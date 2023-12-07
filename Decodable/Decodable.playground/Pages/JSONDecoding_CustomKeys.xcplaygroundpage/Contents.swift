//: [Previous](@previous)

import Foundation

// Definición de la estructura User que implementa el protocolo Decodable
struct User: Decodable {
    // Propiedad que representa el nombre del usuario
    let name: String
    
    // Propiedad que representa la edad del usuario
    let age: Int
    
    // Enum para personalizar las claves de codificación/decodificación
    enum CodingKeys: String, CodingKey {
        case name = "name_of_user" // Personaliza la clave para la propiedad 'name'
        case age                    // Utiliza el nombre de la propiedad para la clave 'age'
    }
}

// Extensión para proporcionar un inicializador personalizado requerido por el protocolo Decodable
extension User {
    init(from decoder: Decoder) throws {
        // Utiliza un contenedor para acceder a las claves personalizadas
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decodifica y asigna el valor para la propiedad 'name'
        self.name = try container.decode(String.self, forKey: .name)
        
        // Decodifica y asigna el valor para la propiedad 'age'
        self.age = try container.decode(Int.self, forKey: .age)
    }
}

// JSON en formato de cadena
let jsonData = """
{
    "name_of_user": "Matías",
    "age": 36
}
""".data(using: .utf8)!

// Intenta decodificar el JSON en un objeto User
if let user = try? JSONDecoder().decode(User.self, from: jsonData) {
    // Imprime el nombre del usuario si la decodificación es exitosa
    print(user.name)
} else {
    // Captura y manejo de errores en caso de falla en la decodificación
    print("Error decoding JSON")
}










//: [Next](@next)
