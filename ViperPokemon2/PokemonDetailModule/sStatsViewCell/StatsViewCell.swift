//
//  StatsViewCell.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 14/05/24.
//

import Foundation
import UIKit

class StatsViewCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var labelstats: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = .lightGray
        progress.layer.cornerRadius = 10
        return progress
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Stats) {
        labelstats.text =  model.stat?.name
        let auxstast = Double(model.baseStat ?? 1) * 0.01
        progressView.setProgress(Float(auxstast), animated: true)
    }
}

extension StatsViewCell: UIColorBackgroundPokemon {
    func setBackgroundColorTypePokemon(pokemonType: String) {
        switch pokemonType {
        case "normal":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#848484")
        case "fire":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#FFBF01")
        case "water":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#20D2F1")
        case "electric":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#EBEE13")
        case "grass":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#52EE13")
        case "ice":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#6FDDEC")
        case "fighting":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#E60B0B")
        case "poison":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#BE0BE6")
        case "ground":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#E6B10B")
        case "flying":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#D981E0")
        case "psychic":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#F11D94")
        case "bug":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#C0DFB1")
        case "rock":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#AFAE6F")
        case "ghost":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#82698B")
        case "dragon":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#324398")
        case "dark":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#835006")
        case "steel":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#B0ADAA")
        case "fairy":
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#D99AB9")
        default:
            progressView.tintColor = Utils.shared.hexStringToUIColor(hex: "#848484")
        }
    }
}
