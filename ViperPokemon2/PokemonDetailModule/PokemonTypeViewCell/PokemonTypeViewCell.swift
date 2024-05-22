//
//  PokemonTypeViewCell.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 09/05/24.
//

import Foundation
import UIKit

class PokemonTypeViewCell: UICollectionViewCell {
    
    lazy var stackTypePokemon: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var imageIconType: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var labelType: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Types){
        if let IconAux = model.type?.name, let name = model.type?.name {
            setBackgroundColorTypePokemon(pokemonType: name)
            imageIconType.image = UIImage(named: IconAux)
            labelType.text = name
            labelType.textColor = .white
        }
    }
}

extension PokemonTypeViewCell: UIColorBackgroundPokemon {
    func setBackgroundColorTypePokemon(pokemonType: String) {
        switch pokemonType {
        case "norma":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#CAC1C1")
        case "fire":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#F2C84B")
        case "water":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#72DDF0")
        case "electric":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#D5DA0A")
        case "grass":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#9FF27D")
        case "ice":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#A8E4EC")
        case "fighting":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#C70202")
        case "poison":
            backgroundColor = Utils.shared.hexStringToUIColor(hex:  "#CE67E5")
        case "ground":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#ECCB64")
        case "flying":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#EDB2F1")
        case "psychic":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#F074BA")
        case "bug":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#51D616")
        case "rock":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#E0DFAF")
        case "ghost":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#D6B0E3")
        case "dragon":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#8F9CDE")
        case "dark":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#AE7626")
        case "steel":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#807E7C")
        case "fairy":
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#D33A85")
        default:
            backgroundColor = Utils.shared.hexStringToUIColor(hex: "#CAC1C1")
        }
    }
}
