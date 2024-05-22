//
//  PokemonDetailViewExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 15/05/24.
//

import Foundation
import UIKit

extension PokemonDetailView: PokemonDetailPresenterUI {
    func setBackgroundColorDetail(pokemonType: String) {
        switch pokemonType {
        case "normal":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#848484")
        case "fire":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#FFBF01")
        case "water":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#20D2F1")
        case "electric":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#EBEE13")
        case "grass":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#52EE13")
        case "ice":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#6FDDEC")
        case "fighting":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#E60B0B")
        case "poison":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#BE0BE6")
        case "ground":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#E6B10B")
        case "flying":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#D981E0")
        case "psychic":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#F11D94")
        case "bug":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#C0DFB1")
        case "rock":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#AFAE6F")
        case "ghost":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#82698B")
        case "dragon":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#324398")
        case "dark":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#835006")
        case "steel":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#B0ADAA")
        case "fairy":
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#D99AB9")
        default:
            view.backgroundColor = Utils.shared.hexStringToUIColor(hex: "#848484")
        }
    }
    
    func updateUI(viewModel: PokemonDetailViewModel) {
        guard let urlImage = viewModel.sprites?.other?.officialArtwork?.frontDefault else {
            return
        }
        setBackgroundColorDetail(pokemonType: viewModel.types?[0].type?.name ?? "normal")
        self.imagePokemon.kf.setImage(with: urlImage)
        self.labelPokemonName.text = viewModel.name
        DispatchQueue.main.async {
            self.collectionType.reloadData()
            self.tableStats.reloadData()
            self.tableMoves.reloadData()
        }
    }
}
