//
//  ViewModel.swift
//  HTTPS_request
//
//  Created by matias on 10/12/2023.
//

import Foundation

// ViewModel: Clase final que gestiona los datos y el estado de carga de una lista de Pokémon
final class ViewModel: ObservableObject {
    // Pokémons: Array de objetos PokemonDataModel. La propiedad @Published garantiza actualizaciones automáticas en las vistas.
    @Published var pokemons: [PokemonDataModel] = []
    
    // isLoading: Bandera booleana que indica si se está cargando actualmente datos. También marcada como @Published para actualizaciones de vistas.
    @Published var isLoading: Bool = false

    // getPokemons: Función para obtener datos de Pokémon desde la PokeAPI
    func getPokemons() {
        // Construir la URL para la PokeAPI
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {
            print("URL inválida")
            return
        }

        // Establece el estado de carga en true antes de realizar la solicitud de red
        isLoading = true

        // Inicia una tarea de datos para obtener datos de Pokémon
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Define la actualización de isLoading hasta salir del ámbito de la función
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }

            // Verifica errores de red
            if let error = error {
                print("Error: \(error)")
                return
            }

            // Verifica una respuesta HTTP válida
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Respuesta inválida")
                return
            }

            do {
                // Utiliza un JSONDecoder para decodificar la respuesta en un PokemonResponseDataModel
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemonResponse = try decoder.decode(PokemonResponseDataModel.self, from: data)

                // Actualiza el array de pokémons con los datos recibidos y realizar la actualización en el hilo principal
                DispatchQueue.main.async {
                    self.pokemons = pokemonResponse.pokemons
                }
            } catch {
                print("Error al decodificar datos: \(error)")
            }
        }.resume()
    }
}
