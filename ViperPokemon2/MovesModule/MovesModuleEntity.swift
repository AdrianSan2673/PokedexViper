//
//  MovesModuleEntity.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation

struct MovesModuleEntity: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case accuracy, power, pp, priority, name
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case contestType = "contest_type"
        case damageClass = "damage_class"
    }
}

struct MetaMoves: Codable {
    var critRate: Int?
    var drain: Int?
    var flinchChance: Int?
    var healing: Int?
    
    enum CodingKeys: String, CodingKey {
        case critRate = "crit_rate"
        case drain,healing
        case flinchChance = "flinch_chance"
    }
}

struct EffectEntries: Codable {
    var effect: String?
    var language: Ability?
    var shortEffect: String?
    
    enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}

struct FlavorTextEntries: Codable {
    var flavorText: String?
    var language: Ability?
    var versionGroup: Ability?
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}
