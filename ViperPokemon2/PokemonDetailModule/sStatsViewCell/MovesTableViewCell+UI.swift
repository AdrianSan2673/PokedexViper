//
//  MovesTableViewCell+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 15/05/24.
//

import Foundation
import UIKit

extension MovesTableViewCell {
    
    func setup(){
        addSubviews()
        configurationConstraint()
    }
    
    func addSubviews(){
        [moveName,image].forEach(stackView.addArrangedSubview)
        [stackView].forEach(addSubview)
    }
    
    func configurationConstraint(){
        NSLayoutConstraint.activate([
            
//            stackView.topAnchor.constraint(equalTo: topAnchor),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
