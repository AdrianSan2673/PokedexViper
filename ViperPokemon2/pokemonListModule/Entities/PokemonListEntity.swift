//
//  PokemonListEntity.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 29/05/23.
//

import Foundation

struct PokemonListEntity: Decodable {
    var attack: Int?
    var defense: Int?
    var description: String?
    var evolution: [EvolutionChain]?
    var height: Int?
    var id: Int?
    var imageUrl: String?
    var name: String?
    var type: String?
    var weight: Int?
    
    enum CodingKeys: String, CodingKey{
        case attack,defense,description,height,id,imageUrl,name,type,weight
        case evolution = "evolutionChain"
    }
}

struct EvolutionChain: Decodable {
    var id: String?
    var name: String?
}
