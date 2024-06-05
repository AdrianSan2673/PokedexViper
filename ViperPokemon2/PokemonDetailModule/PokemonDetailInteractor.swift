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
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(with: .failure(error))
                }
                if let response = (response as? HTTPURLResponse), response.statusCode != 200 {
                    continuation.resume(with: .failure(error ?? SessionError.apiError))
                    return
                }
                guard let responseData = data else {
                    continuation.resume(with: .failure(error ?? SessionError.invalidResponse))
                    return
                }
                do {
                    Task{
                        switch try await Utils.shared.parsearJson(PokemonDetailEntity.self, data: responseData) {
                        case .success(let success):
                            continuation.resume(with: .success(success))
                        case .failure(let failure):
                            continuation.resume(with: .failure(failure))
                        }
                    }
                } catch {
                    continuation.resume(with: .failure(SessionError.invalidResponse))
                }
            }
            task.resume()
        }
    }
}
