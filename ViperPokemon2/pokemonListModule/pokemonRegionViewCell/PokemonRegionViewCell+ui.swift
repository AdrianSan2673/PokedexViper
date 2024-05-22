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
        [labelRegionName, imageRegion].forEach(addSubview)
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            labelRegionName.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelRegionName.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelRegionName.trailingAnchor.constraint(equalTo: imageRegion.leadingAnchor),
            
            imageRegion.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageRegion.leadingAnchor.constraint(equalTo: labelRegionName.trailingAnchor),
            imageRegion.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
