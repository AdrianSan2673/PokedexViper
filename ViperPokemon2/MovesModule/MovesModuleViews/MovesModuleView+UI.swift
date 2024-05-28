//
//  MovesModuleView+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 20/05/24.
//

import Foundation
import UIKit

extension MovesModuleView {
    
    func setupUI() {
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews(){
        
        [labelMoveName,moveDescription,collectionMoveStadistic].forEach(view.addSubview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            labelMoveName.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            labelMoveName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelMoveName.bottomAnchor.constraint(equalTo: moveDescription
                .topAnchor),
            
            moveDescription.topAnchor.constraint(equalTo: labelMoveName.bottomAnchor, constant: 90),
            moveDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            moveDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            moveDescription.bottomAnchor.constraint(equalTo: collectionMoveStadistic.topAnchor),
            
            collectionMoveStadistic.topAnchor.constraint(equalTo: moveDescription.bottomAnchor, constant: 20),
            collectionMoveStadistic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            collectionMoveStadistic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            collectionMoveStadistic.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
