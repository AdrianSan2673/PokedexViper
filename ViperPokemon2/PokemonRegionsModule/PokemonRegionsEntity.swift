//
//  PokemonRegionsEntity.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 24/05/24.
//

import Foundation

struct PokemonRegionsEntity: Codable {
    var pokemonEntries: [PokemonEntries]?
    
    enum CodingKeys: String, CodingKey {
        case pokemonEntries = "pokemon_entries"
    }
}

struct PokemonEntries: Codable {
    var entryNumber: Int?
    var pokemonSpecies: Ability?
    
    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokemonSpecies = "pokemon_species"
    }
}
