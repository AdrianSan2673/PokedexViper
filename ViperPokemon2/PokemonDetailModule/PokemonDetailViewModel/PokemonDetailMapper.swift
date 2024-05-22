//
//  PokemonDetailMapper.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation

struct PokemonDetailMapper {
    func map(entity: PokemonDetailEntity) -> PokemonDetailViewModel {
        PokemonDetailViewModel(abilities: entity.abilities, baseExperience: entity.baseExperience, forms: entity.forms, gameIndices: entity.gameIndices, height: entity.height, locationAreaEncounters: entity.locationAreaEncounters, moves: entity.moves, name: entity.name, sprites: entity.sprites, stats: entity.stats, types: entity.types, weight: entity.weight)
    }
}
