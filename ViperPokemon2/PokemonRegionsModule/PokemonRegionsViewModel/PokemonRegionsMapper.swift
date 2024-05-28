//
//  PokemonRegionsMapper.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation

struct PokemonRegionsMapper {
    func map(entity: PokemonRegionsEntity) -> PokemonRegionsViewModel {
        PokemonRegionsViewModel(pokemonEntries: entity.pokemonEntries)
    }
}
