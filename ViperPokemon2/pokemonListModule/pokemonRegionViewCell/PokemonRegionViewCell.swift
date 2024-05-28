//
//  PokemonRegionViewCell.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 22/05/24.
//

import Foundation
import UIKit

class PokemonRegionViewCell: UICollectionViewCell {
    lazy var labelRegionName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(region: String) {
        setBackgroundColorTypePokemon(pokemonType: region)
        labelRegionName.text = region
    }
}

extension PokemonRegionViewCell: UIColorBackgroundPokemon {
    func setBackgroundColorTypePokemon(pokemonType: String) {
        switch pokemonType {
        case "Kanto":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#F2C84B")
        case "Johto":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#72DDF0")
        case "Hoenn":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#D5DA0A")
        case "Sinnoh":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#9FF27D")
        case "Teselia":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#A8E4EC")
        case "Kalos":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#C70202")
        case "Alola":
            backgroundColor = Utils.shared.hexStringToUIColor(hex:  "#CE67E5")
        case "Galar":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#ECCB64")
        case "Paldea":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#EDB2F1")
        default:
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "B8B6BC")
        }
    }
    
    
}
