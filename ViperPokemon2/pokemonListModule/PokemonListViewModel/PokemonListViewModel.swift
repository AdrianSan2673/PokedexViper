//
//  PokemonListViewModel.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 30/05/23.
//

import Foundation

struct PokemonListViewModel {
    var name: String
    var attack: Int
    var defense: Int
    var imageUrl: URL?
    var type: String
    var id: Int
}

enum TypePokemonColors: String {
    case norma
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
    
    var colorsTypes: String {
        switch self {
        case .norma: return "#848484"
        case .fire: return "#FFBF01"
        case .water: return "#20D2F1"
        case .electric: return "#EBEE13"
        case .grass: return "#52EE13"
        case .ice: return "#6FDDEC"
        case .fighting: return "#E60B0B"
        case .poison: return "#BE0BE6"
        case .ground: return "#E6B10B"
        case .flying: return "#D981E0"
        case .psychic: return "#F11D94"
        case .bug: return "#C0DFB1"
        case .rock: return "#AFAE6F"
        case .ghost: return "#82698B"
        case .dragon: return "#324398"
        case .dark: return "#835006"
        case .steel: return "#B0ADAA"
        case .fairy: return "#D99AB9"
        }
    }
    
}
