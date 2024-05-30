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
        let url = URL(string: "https://pokeapi.co/api/v2/pokedex/\(regionAux)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(PokemonRegionsEntity.self, from: data)
    } 
}
