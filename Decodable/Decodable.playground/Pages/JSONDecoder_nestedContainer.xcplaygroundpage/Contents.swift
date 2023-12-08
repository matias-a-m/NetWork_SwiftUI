//: [Previous](@previous)

import Foundation

// Definición de la estructura User que implementa el protocolo Decodable
struct User: Decodable {
    // Propiedad que representa el nombre del usuario
    let name: String
    
    // Propiedad que representa la edad del usuario
    let age: Int
    
    // Propiedad que representa la ciudad
    let city: String
    
    let zip: Int
    
    // Enum para personalizar las claves de codificación/decodificación
    enum CodingKeys: String, CodingKey {
        case name = "name_of_user" // Personaliza la clave para la propiedad 'name'
        case age                    // Utiliza el nombre de la propiedad para la clave 'age'
        case address
        case city
        case zip
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        let address = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .address)
        self.city = try address.decode(String.self, forKey: .city)
        self.zip = try address.decode(Int.self, forKey: .zip)
    }
    
}

//// Definición de la estructura Address que implementa el protocolo Decodable
//struct Address: Decodable {
//    let city: String
//    let zip: Int
//    let street: String
//}

// JSON en formato de cadena
let jsonData = """
{
    "name_of_user": "Matías",
    "age": 36,
    "address":{
        "city":"Buenos Aires",
        "zip": 1234,
        "street": "Paseo 1, nº 123"
    }
}
""".data(using: .utf8)!

// Intenta decodificar el JSON en un objeto User
do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    
    // Accede a la ciudad desde la propiedad 'address' dentro del objeto User
    print("Nombre: \(user.name)")
    print("Edad: \(user.age)")
    print("Ciudad: \(user.city)")
    print("Zip code: \(user.zip)")
} catch {
    // Manejo de errores en caso de que la decodificación falle
    print("Error al decodificar el JSON: \(error)")
}






//: [Next](@next)
