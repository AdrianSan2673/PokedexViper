//
//  File.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 24/05/24.
//

import Foundation

protocol PokemonRegionsInteractable: AnyObject {
    func getPokemonRegionsInteractor(region: Int) async throws -> PokemonRegionsEntity
}

class PokemonRegionsInteractor: PokemonRegionsInteractable {
    func getPokemonRegionsInteractor(region: Int) async throws -> PokemonRegionsEntity {
        var pokemonList: PokemonRegionsEntity?
        var regionAux = 1
        switch region {
        case 0:
            regionAux = 2
        case 1:
            regionAux = 3
        case 2:
            regionAux = 4
        case 3:
            regionAux = 5
        case 4:
            regionAux = 8
        case 5:
            regionAux = 12
        case 6:
            regionAux = 16
        case 7:
            regionAux = 27
        case 8:
            regionAux = 31
        default:
            regionAux = 2
        }
        
        guard let url = URL(string: Utils.shared.constantURLPokemonAPI + EndPoints.pokemonRegion.rawValue + String(regionAux)) else {
            throw SessionError.invalidEndPoint
        }
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(with: .failure(error))
                    return
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
                        switch try await Utils.shared.parsearJson(PokemonRegionsEntity.self,data: responseData) {
                        case .success(let pokemonResult):
                            continuation.resume(with: .success(pokemonResult))
                        case .failure(let error):
                            continuation.resume(with: .failure(error))
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
