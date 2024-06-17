//
//  MovesModuleInteractor.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation

protocol MovesModuleInteractable: AnyObject {
    func getMovesDetails(id: String) async throws -> MovesModuleEntity
}

class MovesModuleInteractor: MovesModuleInteractable {
    func getMovesDetails(id: String) async throws -> MovesModuleEntity {
                
        guard let url = URL(string:  id) else {
            throw SessionError.invalidEndPoint
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            Utils.shared.loadURLAndDecodePokeApi(url: url) { (result: MovesModuleEntity?, error: SessionError?) in
                if let data = result {
                    continuation.resume(returning: data)
                }else if let sessionError = error {
                    continuation.resume(throwing: sessionError)
                } else {
                    continuation.resume(throwing: SessionError.invalidEndPoint)
                }
            }
        }
    }
}
