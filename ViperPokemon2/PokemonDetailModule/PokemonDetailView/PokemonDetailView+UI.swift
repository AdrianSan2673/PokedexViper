//
//  PokemonDetailView+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 09/05/24.
//

import Foundation
import UIKit

extension PokemonDetailView {
    
    func setupIU(){
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews(){
        [viewStadistic,imagePokemon].forEach(view.addSubview)
        [labelPokemonName,collectionType,segmentControl,viewStats,viewMoves,viewEvolutions].forEach(viewStadistic.addArrangedSubview)
        [tableStats].forEach(viewStats.addSubview)
        [tableMoves].forEach(viewMoves.addSubview)
        [collectionEvolution].forEach(viewEvolutions.addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imagePokemon.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            imagePokemon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePokemon.bottomAnchor.constraint(equalTo: viewStadistic.topAnchor,constant: 50),
            imagePokemon.heightAnchor.constraint(equalToConstant: 160),
            imagePokemon.widthAnchor.constraint(equalToConstant: 160),
            
            viewStadistic.topAnchor.constraint(equalTo: imagePokemon.bottomAnchor),
            viewStadistic.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewStadistic.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewStadistic.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelPokemonName.topAnchor.constraint(equalTo: viewStadistic.topAnchor, constant: 40),
           
            collectionType.leadingAnchor.constraint(equalTo: viewStadistic.leadingAnchor, constant: 30),
            collectionType.heightAnchor.constraint(equalToConstant: 30),
            
            viewStats.leadingAnchor.constraint(equalTo: viewStadistic.leadingAnchor, constant: 10),
            viewStats.trailingAnchor.constraint(equalTo: viewStadistic.trailingAnchor, constant: -10),
            viewStats.bottomAnchor.constraint(equalTo: viewStadistic.bottomAnchor, constant: -10),
            
            tableStats.topAnchor.constraint(equalTo: viewStats.topAnchor, constant: 20),
            tableStats.leadingAnchor.constraint(equalTo: viewStats.leadingAnchor),
            tableStats.trailingAnchor.constraint(equalTo: viewStats.trailingAnchor),
            tableStats.bottomAnchor.constraint(equalTo: viewStats.bottomAnchor),
            
            viewMoves.leadingAnchor.constraint(equalTo: viewStadistic.leadingAnchor, constant: 10),
            viewMoves.trailingAnchor.constraint(equalTo: viewStadistic.trailingAnchor, constant: -10),
            viewMoves.bottomAnchor.constraint(equalTo: viewStadistic.bottomAnchor, constant: -10),
            
            tableMoves.topAnchor.constraint(equalTo: viewMoves.topAnchor, constant: 20),
            tableMoves.leadingAnchor.constraint(equalTo: viewMoves.leadingAnchor),
            tableMoves.trailingAnchor.constraint(equalTo: viewMoves.trailingAnchor),
            tableMoves.bottomAnchor.constraint(equalTo: viewMoves.bottomAnchor),
            
            viewEvolutions.leadingAnchor.constraint(equalTo: viewStadistic.leadingAnchor, constant: 10),
            viewEvolutions.trailingAnchor.constraint(equalTo: viewStadistic.trailingAnchor, constant: -10),
            viewEvolutions.bottomAnchor.constraint(equalTo: viewStadistic.bottomAnchor, constant: -10),
            
            collectionEvolution.topAnchor.constraint(equalTo: viewEvolutions.topAnchor, constant: 20),
            collectionEvolution.leadingAnchor.constraint(equalTo: viewEvolutions.leadingAnchor),
            collectionEvolution.trailingAnchor.constraint(equalTo: viewEvolutions.trailingAnchor),
            collectionEvolution.bottomAnchor.constraint(equalTo: viewEvolutions.bottomAnchor),
        ])
    }
}
