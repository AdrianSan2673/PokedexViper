//
//  MovesTableViewCell.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 15/05/24.
//

import Foundation
import UIKit

class MovesTableViewCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var moveName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right.circle")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Moves){
        if let move = model.move?.name {
            moveName.text = move
        }
    }
    func configureRegions(model: PokemonEntries){
        if let pokemon = model.pokemonSpecies?.name {
            moveName.text = pokemon
        } else {
            moveName.text = "NA"
        }
    }
}
