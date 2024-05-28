//
//  PokemonRegionViewCell+ui.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 22/05/24.
//

import Foundation
import UIKit

extension PokemonRegionViewCell {
    
    func setup() {
        addSubviews()
        configureConstraints()
    }
    
    func addSubviews() {
        [labelRegionName].forEach(addSubview)
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            labelRegionName.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelRegionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelRegionName.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
