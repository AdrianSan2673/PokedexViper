//
//  PokemonListView+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 06/05/24.
//

import Foundation
import UIKit

extension PokemonListView {
    func setup(){
        addSubViews()
        configurationConstraint()
    }
    
    func addSubViews(){
        [labelQuestion,txtSearch,labelRegion,regionTable,labelGeneration,pokemonTable].forEach(scroll.addSubview)
        [scroll].forEach(view.addSubview)
    }
    
    func configurationConstraint(){
        NSLayoutConstraint.activate([
            
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            labelQuestion.topAnchor.constraint(equalTo: scroll.topAnchor),
            labelQuestion.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 25),
            labelQuestion.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            labelQuestion.bottomAnchor.constraint(equalTo: txtSearch.topAnchor),
            
            txtSearch.topAnchor.constraint(equalTo: labelQuestion.bottomAnchor),
            txtSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtSearch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            txtSearch.bottomAnchor.constraint(equalTo: labelRegion.topAnchor),
            
            labelRegion.topAnchor.constraint(equalTo: txtSearch.bottomAnchor),
            labelRegion.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            labelRegion.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelRegion.bottomAnchor.constraint(equalTo: regionTable.topAnchor),
            
            regionTable.topAnchor.constraint(equalTo: labelRegion.bottomAnchor),
            regionTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            regionTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            regionTable.bottomAnchor.constraint(equalTo: labelGeneration.topAnchor),
            regionTable.heightAnchor.constraint(equalToConstant: 110),
            
            labelGeneration.topAnchor.constraint(equalTo: regionTable.bottomAnchor),
            labelGeneration.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            labelGeneration.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelGeneration.bottomAnchor.constraint(equalTo: pokemonTable.topAnchor),
           
            pokemonTable.topAnchor.constraint(equalTo: labelGeneration.bottomAnchor),
            pokemonTable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            pokemonTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            pokemonTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
