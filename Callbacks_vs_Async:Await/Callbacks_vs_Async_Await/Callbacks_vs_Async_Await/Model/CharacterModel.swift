//
//  CharacterModel.swift
//  Callbacks_vs_Async_Await
//
//  Created by matias on 11/12/2023.
//

import Foundation

struct CharacterBasicInfo{
    let name: String
    let image: URL?
    let firstEpisodeTitle: String
    let dimension: String
    
    static var empty: Self{
        .init(name: "", image: nil, firstEpisodeTitle: "", dimension: "")
    }
}

struct CharacterModel: Decodable{
    let id: Int
    let name: String
    let image: String
    let episode: [String]
    let locationName: String
    let locationURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case episode
        case location
//        case locationName
        case locationURL = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CharacterModel.CodingKeys> = try decoder.container(keyedBy: CharacterModel.CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: CharacterModel.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: CharacterModel.CodingKeys.name)
        self.image = try container.decode(String.self, forKey: CharacterModel.CodingKeys.image)
        self.episode = try container.decode([String].self, forKey: CharacterModel.CodingKeys.episode)
        
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        self.locationName = try locationContainer.decode(String.self, forKey: .name)
        self.locationURL = try locationContainer.decode(String.self, forKey: .locationURL)
        
    }
    
    
 
 
    
}
