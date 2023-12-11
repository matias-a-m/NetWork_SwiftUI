//
//  PokemonResponseDataModel.swift
//  HTTPS_request
//
//  Created by matias on 11/12/2023.
//

import Foundation

// Definición del modelo de datos de la respuesta de la API que contiene una lista de Pokémon
struct PokemonResponseDataModel: Decodable {
    // Lista de Pokémon en la respuesta
    let pokemons: [PokemonDataModel]
    
    // Enumeración para las claves de codificación
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    // Inicializador personalizado para decodificar la respuesta
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decodificación de la lista de Pokémon a partir de la clave "results"
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
