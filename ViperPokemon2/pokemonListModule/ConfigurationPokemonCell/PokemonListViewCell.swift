//
//  PokemonListViewCell.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 30/05/23.
//

import Foundation
import Kingfisher
import UIKit
import SwiftUI

class PokemonListViewCell : UICollectionViewCell {
    
    let imageViewPokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelPokemonId: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let labelPokemonName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.backgroundColor = .lightGray
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.cornerRadius = 10
        label.textColor = .white
        return label
    }()
    
    let labeltype: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.backgroundColor = .lightGray
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    let spaceBlack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func configure(model: PokemonListViewModel) {
        setBackgroundColorTypePokemon(pokemonType: model.type)
        imageViewPokemon.kf.setImage(with: model.imageUrl)
        labelPokemonId.text = "  #\(model.id) "
        labelPokemonName.text = "  \(model.name) "
        labeltype.text = "  Type: \(model.type) "
    }
    
    func setBackgroundColorTypePokemon(pokemonType: String) {
        switch pokemonType {
        case "norma":
            backgroundColor = hexStringToUIColor(hex: "#848484")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#CAC1C1")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#CAC1C1")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#CAC1C1")
        case "fire":
            backgroundColor = hexStringToUIColor(hex: "#FFBF01")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#F2C84B")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#F2C84B")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#F2C84B")
        case "water":
            backgroundColor = hexStringToUIColor(hex: "#20D2F1")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#72DDF0")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#72DDF0")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#72DDF0")
        case "electric":
            backgroundColor = hexStringToUIColor(hex: "#EBEE13")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#D5DA0A")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#D5DA0A")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#D5DA0A")
        case "grass":
            backgroundColor = hexStringToUIColor(hex: "#52EE13")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#9FF27D")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#9FF27D")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#9FF27D")
        case "ice":
            backgroundColor = hexStringToUIColor(hex: "#6FDDEC")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#A8E4EC")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#A8E4EC")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#A8E4EC")
        case "fighting":
            backgroundColor = hexStringToUIColor(hex: "#E60B0B")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#C70202")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#C70202")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#C70202")
        case "poison":
            backgroundColor = hexStringToUIColor(hex: "#BE0BE6")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#CE67E5")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#CE67E5")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#CE67E5")
        case "ground":
            backgroundColor = hexStringToUIColor(hex: "#E6B10B")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#ECCB64")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#ECCB64")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#ECCB64")
        case "flying":
            backgroundColor = hexStringToUIColor(hex: "#D981E0")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#EDB2F1")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#EDB2F1")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#EDB2F1")
        case "psychic":
            backgroundColor = hexStringToUIColor(hex: "#F11D94")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#F074BA")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#F074BA")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#F074BA")
        case "bug":
            backgroundColor = hexStringToUIColor(hex: "#C0DFB1")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#51D616")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#51D616")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#51D616")
        case "rock":
            backgroundColor = hexStringToUIColor(hex: "#AFAE6F")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#E0DFAF")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#E0DFAF")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#E0DFAF")
        case "ghost":
            backgroundColor = hexStringToUIColor(hex: "#82698B")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#D6B0E3")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#D6B0E3")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#D6B0E3")
        case "dragon":
            backgroundColor = hexStringToUIColor(hex: "#324398")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#8F9CDE")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#8F9CDE")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#8F9CDE")
        case "dark":
            backgroundColor = hexStringToUIColor(hex: "#835006")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#AE7626")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#AE7626")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#AE7626")
        case "steel":
            backgroundColor = hexStringToUIColor(hex: "#B0ADAA")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#807E7C")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#807E7C")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#807E7C")
        case "fairy":
            backgroundColor = hexStringToUIColor(hex: "#D99AB9")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#D33A85")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#D33A85")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#D33A85")
        default:
            backgroundColor = hexStringToUIColor(hex: "#848484")
            labeltype.backgroundColor = hexStringToUIColor(hex: "#CAC1C1")
            labelPokemonId.backgroundColor = hexStringToUIColor(hex: "#CAC1C1")
            labelPokemonName.backgroundColor = hexStringToUIColor(hex: "#CAC1C1")
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
