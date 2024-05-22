//
//  PokemonListMapper.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 30/05/23.
//

import Foundation

struct PokemonListMapper {
    
    func map(entity: PokemonListEntity) -> PokemonListViewModel {
        var attackAux: Int?
        var nameAxu: String?
        var defenseAux: Int?
        var imageUrlaux: String?
        var typeAux: String?
        var idAux: Int?
        
        if entity.attack != nil, entity.defense != nil, entity.name != nil, entity.imageUrl != nil, entity.type != nil, entity.id != nil {
            attackAux = entity.attack ?? 0
            nameAxu = entity.name ?? ""
            defenseAux = entity.defense ?? 0
            imageUrlaux = entity.imageUrl ?? ""
            typeAux = entity.type ?? ""
            idAux = entity.id ?? 0
            
        }
        return PokemonListViewModel(name: nameAxu ?? "", attack: attackAux ?? 0, defense: defenseAux ?? 0
                                    , imageUrl: URL(string: imageUrlaux ?? ""), type: typeAux ?? "", id: idAux ?? 0 )
    }
    
}
