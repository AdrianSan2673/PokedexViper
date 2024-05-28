//
//  PokemonRegionsView+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation
import UIKit

extension PokemonRegionsView {
    func setupUI(){
        addSubViews()
        setupConstraints()
    }
    func addSubViews(){
        [imagePokemon,tablePokemonRegion].forEach(view.addSubview)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imagePokemon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imagePokemon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePokemon.bottomAnchor.constraint(equalTo: tablePokemonRegion.topAnchor),
            imagePokemon.heightAnchor.constraint(equalToConstant: 200),
            imagePokemon.widthAnchor.constraint(equalToConstant: 200),
            
            tablePokemonRegion.topAnchor.constraint(equalTo: imagePokemon.bottomAnchor, constant: 60),
            tablePokemonRegion.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tablePokemonRegion.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tablePokemonRegion.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
