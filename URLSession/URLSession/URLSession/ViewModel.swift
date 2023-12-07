//
//  ViewModel.swift
//  URLSession
//
//  Created by matias on 07/12/2023.
//

import Foundation

final class ViewModel {
    
    func executeAPI() {
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Bizarrap") else {
            print("Error: URL inválida")
            return
        }

        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            // Manejo de errores de red o solicitud
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }
            
            // Asegurarse de que haya datos
            guard let data = data else {
                print("Error: No se recibieron datos")
                return
            }
            
            // Convertir los datos a un objeto JSON
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                // Imprimir la representación en cadena del objeto JSON
                print("Respuesta JSON: \(jsonObject)")
            } catch {
                print("Error al convertir datos a JSON: \(error.localizedDescription)")
            }
        }
        
        // Inicia la tarea
        task.resume()
    }
    
}
