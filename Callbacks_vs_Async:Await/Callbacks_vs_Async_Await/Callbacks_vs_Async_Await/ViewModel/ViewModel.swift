//
//  ViewModel.swift
//  Callbacks_vs_Async_Await
//
//  Created by matias on 11/12/2023.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var characterBasicInfo: CharacterBasicInfo = .empty
    
    func executeRequest() async {
        let characterURL = URL(string: "https://rickandmortyapi.com/api/character/1")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: characterURL)
            let characterModel = try JSONDecoder().decode(CharacterModel.self, from: data)
            print("Character Model \(characterModel)")
            
            let firstEpisodeURL = URL(string: characterModel.episode.first!)!
            let (dataFirstEpisode, _) = try await URLSession.shared.data(from: firstEpisodeURL)
            let episodeModel = try JSONDecoder().decode(EpisodeModel.self, from: dataFirstEpisode)
            print("Episode Model: \(episodeModel)")
            
            let characterLocationURL = URL(string: characterModel.locationURL)!
            let (dataLocation, _) = try await URLSession.shared.data(from: characterLocationURL)
            let locationModel = try JSONDecoder().decode(LocationModel.self, from: dataLocation)
            print("Location Model: \(locationModel)")
            
            DispatchQueue.main.async {
                // Actualiza la propiedad @Published en el hilo principal
                self.characterBasicInfo = .init(name: characterModel.name, image: URL(string: characterModel.image)!, firstEpisodeTitle: episodeModel.name, dimension: locationModel.dimension!)
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
