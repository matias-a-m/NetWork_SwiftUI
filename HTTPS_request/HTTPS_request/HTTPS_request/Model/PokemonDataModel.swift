//
//  PokemonDataModel.swift
//  HTTPS_request
//
//  Created by matias on 11/12/2023.
//

import Foundation

// Definición del modelo de datos de un Pokémon
struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}
