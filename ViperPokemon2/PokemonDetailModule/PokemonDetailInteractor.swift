//
//  PokemonDetailInteractor.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation

protocol PokemonDetailInteractable: AnyObject {
    func getPokemonDetail(withId id: String) async -> PokemonDetailEntity
}

class PokemonDetailInteractor: PokemonDetailInteractable {
    
    func getPokemonDetail(withId id: String) async -> PokemonDetailEntity {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(PokemonDetailEntity.self, from: data)
    }
}
