//
//  PokemonDetailInteractor.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation

protocol PokemonDetailInteractable: AnyObject {
    func getPokemonDetail(withId id: String) async throws  -> PokemonDetailEntity
}

class PokemonDetailInteractor: PokemonDetailInteractable {
    
    func getPokemonDetail(withId id: String) async throws -> PokemonDetailEntity {
        let url = URL(string: Utils.shared
            .constantURLPokemonAPI + EndPoints.pokemonPokemon.rawValue + id)!
        
        return try await withCheckedThrowingContinuation { continuation in
            Utils.shared.loadURLAndDecodePokeApi(url: url) { (result: PokemonDetailEntity? , error: SessionError?) in
                if let data = result {
                    continuation.resume(returning: data)
                } else if let sessionError = error {
                    continuation.resume(throwing: sessionError)
                } else {
                    continuation.resume(throwing: SessionError.invalidEndPoint)
                }
            }
        }
    }
}
