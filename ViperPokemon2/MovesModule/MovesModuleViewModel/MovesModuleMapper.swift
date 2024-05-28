//
//  MovesModuleMapper.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation

struct MovesModuleMapper {
    func map(entity: MovesModuleEntity) -> MovesModuleViewModel {
        MovesModuleViewModel(name: entity.name, effectEntries: entity.effectEntries?[0].effect, arrayEstadistcs: [
            "Accuracy: \(entity.accuracy ?? 0)",
            "Power: \(entity.power ?? 0)",
            "PP: \(entity.pp ?? 0)",
            "Priority: \(entity.priority ?? 0)",
            "Contest Type: \(entity.contestType?.name ?? "NA")",
            "Damage Class: \(entity.damageClass?.name ?? "NA")",
            "Crit rate: \(entity.meta?.critRate ?? 0)",
            "Drain: \(entity.meta?.drain ?? 0)",
            "Flinch chance: \(entity.meta?.flinchChance ?? 0)",
            "Healing: \(entity.meta?.healing ?? 0)"
        ])
    }
}
