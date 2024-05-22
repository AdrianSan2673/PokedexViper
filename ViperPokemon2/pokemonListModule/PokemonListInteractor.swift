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
        //guard let url = URL(string: endPoints.pokemonApi.rawValue) else { return }
        let url = URL(string: EndPoints.pokemonApi.rawValue)!
        //let session = URLSession(configuration: .default)
        
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
                do {
                    if let safeData = data?.parseData(quitarString: "null,") {
                        if let pokeList = self.parsearJSON(datosPokemon: safeData) {
                            self.listPokemon = pokeList
                            continuation.resume(with: .success(self.listPokemon))
                        }
                    }
                } catch {
                    continuation.resume(with: .failure(error))
                }
            }
            task.resume()
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

