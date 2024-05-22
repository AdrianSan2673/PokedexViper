//
//  MovesModuleViewModel.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation

struct MovesModuleViewModel {
    var name: String?
    var accuracy: Int?
    var effectEntries: [EffectEntries]?
    var flavorTextEntries: [FlavorTextEntries]?
    var power: Int?
    var pp: Int?
    var priority: Int?
    var contestType: Ability?
    var damageClass: Ability?
    var meta: MetaMoves?
}
