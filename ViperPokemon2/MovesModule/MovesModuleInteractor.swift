//
//  MovesModuleInteractor.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation

protocol MovesModuleInteractable: AnyObject {
    func getMovesDetails(id: String) async -> MovesModuleEntity
}

class MovesModuleInteractor: MovesModuleInteractable {
    func getMovesDetails(id: String) async -> MovesModuleEntity {
        let url = URL(string: id)
        let (data, _) = try! await URLSession.shared.data(from: url!)
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(MovesModuleEntity.self, from: data)
    }
}
