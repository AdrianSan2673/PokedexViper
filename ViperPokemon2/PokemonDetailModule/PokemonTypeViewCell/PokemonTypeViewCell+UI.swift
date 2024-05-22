//
//  PokemonTypeViewCell+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 09/05/24.
//

import Foundation
import UIKit
extension PokemonTypeViewCell {
    func setup(){
        addSubviews()
        setupConstraint()
    }
    
    func addSubviews() {
        [imageIconType,labelType].forEach(stackTypePokemon.addArrangedSubview)
        [stackTypePokemon].forEach(addSubview)
    }
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            stackTypePokemon.topAnchor.constraint(equalTo: topAnchor),
            stackTypePokemon.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackTypePokemon.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackTypePokemon.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
