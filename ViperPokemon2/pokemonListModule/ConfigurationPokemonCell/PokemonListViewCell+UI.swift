//
//  PokemonListViewCell+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 06/05/24.
//

import Foundation
import UIKit

extension PokemonListViewCell {
    
    func setup(){
        addSubviews()
        configureConstraint()
    }
    
    func addSubviews(){
        [imageViewPokemon, labelPokemonId,labelPokemonName, labeltype, spaceBlack].forEach(addSubview)
    }
    
    func configureConstraint(){
        NSLayoutConstraint.activate([
            imageViewPokemon.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewPokemon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageViewPokemon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30),
            
            imageViewPokemon.heightAnchor.constraint(equalToConstant: 70),
            imageViewPokemon.widthAnchor.constraint(equalToConstant: 70),
            
            labelPokemonId.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            labelPokemonId.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
            labelPokemonId.bottomAnchor.constraint(equalTo: labelPokemonName.topAnchor,constant: -2),
            
            labelPokemonName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            labelPokemonName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            labelPokemonName.topAnchor.constraint(equalTo: labelPokemonId.bottomAnchor),
            labelPokemonName.bottomAnchor.constraint(equalTo: labeltype.topAnchor, constant: -2),
            
            labeltype.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            labeltype.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            labeltype.topAnchor.constraint(equalTo: labelPokemonName.bottomAnchor, constant: 1),
            labeltype.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            //spaceBlack.topAnchor.constraint(equalTo: labeltype.bottomAnchor),
            //spaceBlack.leadingAnchor.constraint(equalTo: leadingAnchor),
            //spaceBlack.trailingAnchor.constraint(equalTo: trailingAnchor),
            //spaceBlack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
