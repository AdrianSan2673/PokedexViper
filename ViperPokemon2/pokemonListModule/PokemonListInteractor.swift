//
//  PokemonListInteractor.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 29/05/23.
//

import Foundation

protocol PokemonListInteractable: AnyObject {
    func getPokemonListInteractor() async throws -> [PokemonListEntity]
}

class PokemonListInteractor: PokemonListInteractable {
    
    var listPokemon: [PokemonListEntity] = []
    
    func getPokemonListInteractor() async throws -> [PokemonListEntity] {
    
        guard let url = URL(string: EndPoints.pokemonApi.rawValue) else {
            throw SessionError.invalidEndPoint
        }
        return try await withCheckedThrowingContinuation { continuation in
            Utils.shared.loadURLAndDecodeAPIList(url: url) { (result: [PokemonListEntity]?, error: SessionError?) in
                if let data = result {
                    continuation.resume(returning: .init(data))
                } else if let sessionError = error {
                    continuation.resume(throwing: sessionError)
                } else {
                    continuation.resume(throwing: SessionError.invalidEndPoint)
                }
            }
        }
    }
    
    func parsearJSON(datosPokemon: Data) -> [PokemonListEntity]? {
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode([PokemonListEntity].self, from: datosPokemon)
            return datosDecodificados
        } catch let DecodingError.dataCorrupted(context) {
            print("error al decodificar los datos", context)
            return nil
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

