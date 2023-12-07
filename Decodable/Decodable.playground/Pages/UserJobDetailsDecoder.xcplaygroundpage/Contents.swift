//: [Previous](@previous)

import Foundation

// Definición de la estructura User que implementa el protocolo Decodable
struct User: Decodable {
    let name: String
    let age: Int
}

// Definición de la estructura JobDetails que implementa el protocolo Decodable
struct JobDetails: Decodable {
    var name: String
    var description: String
}

// Definición de la estructura Curriculum que implementa el protocolo Decodable
struct Curriculum: Decodable {
    var identifier: Int
    var user: User
    var job: JobDetails
}

// JSON en formato de cadena
let jsonData = """
{
    "identifier": 123456789,
    "user": {
        "name": "Matías",
        "age": 36
    },
    "job": {
        "name": "Software Engineer",
        "description": "Knowledge Combine, SwiftUI, UIKit, RxSwift, Cocoapods, etc"
    }
}
""".data(using: .utf8)!

do {
    // Intenta decodificar el JSON en un objeto Curriculum
    let curriculum = try JSONDecoder().decode(Curriculum.self, from: jsonData)

    // Imprime el nombre del trabajo del curriculum si la decodificación es exitosa
    print("Job Name: \(curriculum.job.name)")
} catch {
    // Captura y manejo de errores en caso de falla en la decodificación
    print("Error decoding JSON: \(error)")
}



//: [Next](@next)
