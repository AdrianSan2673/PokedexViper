//
//  File.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 24/05/24.
//

import Foundation

protocol PokemonRegionsInteractable: AnyObject {
    func getPokemonRegionsInteractor(region: Int) async -> PokemonRegionsEntity
}

class PokemonRegionsInteractor: PokemonRegionsInteractable {
    func getPokemonRegionsInteractor(region: Int) async -> PokemonRegionsEntity {
        let url = URL(string: "https://pokeapi.co/api/v2/pokedex/\(region + 2)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(PokemonRegionsEntity.self, from: data)
    } 
}
