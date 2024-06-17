//
//  PokemonDetailEntity.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation

struct PokemonDetailEntity: Codable {
    var abilities : [Abilities]?
    var baseExperience: Int?
    var cries: Cries?
    var forms: [Ability]?
    var gameIndices: [GameIndices]?
    var height: Int?
    var id: Int?
    var locationAreaEncounters: String?
    var moves: [Moves]?
    var name: String?
    var order: Int?
    var species: Ability?
    var sprites: Sprites?
    var stats: [Stats]?
    var types: [Types]?
    var weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case abilities, cries, forms, height, id, moves, name, order, species, sprites, stats, types, weight
        case baseExperience = "base_experience"
        case gameIndices = "game_indices"
        case locationAreaEncounters = "location_area_encounters"
    }
}

struct Abilities: Codable {
    var ability: Ability?
    var isHidden: Bool?
    var slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case ability, slot
        case isHidden = "is_hidden"
    }
}

struct Ability: Codable {
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name,url
    }
}

struct Cries: Codable {
    var latest: String?
    var legacy: String?
    
    enum CodingKeys: String, CodingKey {
        case latest,legacy
    }
}

struct GameIndices: Codable {
    var gameIndex: Int?
    var version: Ability?
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

struct Moves: Codable {
    var move: Ability?
    var versionGroupDetails: [VersionGroupDetails]?
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct VersionGroupDetails: Codable {
    var levelLearnedAt: Int?
    var moveLearnMethod: Ability?
    var versionGroup: Ability?
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct Sprites: Codable {
    var backDefault: URL?
    var backFemale: URL?
    var backShiny: URL?
    var backShinyFemale: URL?
    var frontDefault: URL?
    var frontFemale: URL?
    var frontShiny: URL?
    var frontShinyFemale: URL?
    var other: OtherSprites?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
    }
}

struct OtherSprites: Codable {
    var dreamWorld: DreamWorld?
    var officialArtwork: AfficialArtwork?
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

struct DreamWorld: Codable {
    var frontDefault: URL?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct AfficialArtwork: Codable {
    var frontDefault: URL?
    var frontShiny: URL?
    
    enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

struct Stats: Codable {
    var baseStat: Int?
    var effort: Int?
    var stat: Ability?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct Types: Codable {
    var slot: Int?
    var type: Ability?
}
