import UIKit

// Definición de la estructura User que implementa el protocolo Decodable
struct User: Decodable {
    let name: String
    let age: Int
}

// JSON en formato de cadena
let jsonData = """
{
    "name": "Matías",
    "age": 36
}
""".data(using: .utf8)


do {
    // Verifica si se pudo crear el objeto Data a partir del JSON
    guard let data = jsonData else {
        throw NSError(domain: "JSONDataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create data from JSON string"])
    }

    // Intenta decodificar el JSON en un objeto User
    let user = try JSONDecoder().decode(User.self, from: data)
    
    // Imprime la información del usuario si la decodificación es exitosa
    print("User name: \(user.name)")
    print("User age: \(user.age)")
} catch {
    // Captura y manejo de errores en caso de falla en la decodificación
    print("Error decoding JSON: \(error)")
}
