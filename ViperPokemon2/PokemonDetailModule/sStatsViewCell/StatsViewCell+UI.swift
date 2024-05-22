//
//  StatsViewCell+UI.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 14/05/24.
//

import Foundation
import UIKit

extension StatsViewCell {
    
    func setup(){
        addSubviews()
        configureContraints()
    }
    
    func addSubviews() {
        [labelstats, progressView].forEach(stackView.addArrangedSubview)
        [stackView].forEach(addSubview)
    }
    
    func configureContraints(){
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
    
            progressView.leadingAnchor.constraint(equalTo: labelstats.trailingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            progressView.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
}
