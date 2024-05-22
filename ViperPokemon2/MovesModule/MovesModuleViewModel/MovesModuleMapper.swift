//
//  MovesModuleMapper.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation

struct MovesModuleMapper {
    func map(entity: MovesModuleEntity) -> MovesModuleViewModel {
        .init(name: entity.name, accuracy: entity.accuracy, effectEntries: entity.effectEntries, flavorTextEntries: entity.flavorTextEntries, power: entity.power, pp: entity.pp, priority: entity.priority,contestType: entity.contestType,damageClass: entity.damageClass ,meta: entity.meta)
    }
}
