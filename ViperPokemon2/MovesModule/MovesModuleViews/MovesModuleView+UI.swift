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
        [labelPower,labelPP, labelPriority].forEach(stackHorizontal.addArrangedSubview)
        
        [stackHorizontalStadisticsTitle,stackHorizontalStadisticsValue].forEach(stackVerticalStadistics.addArrangedSubview)
        
        [labelCritRate,labelDrain,labelFlinchChance].forEach(stackHorizontalStadisticsTitle.addArrangedSubview)
        [labelCritRateValue,labelDrainValue,labelFlinchChanceValue].forEach(stackHorizontalStadisticsValue.addArrangedSubview)
        
        [labelMoveName,stackHorizontal, moveDescription, uiViewStadistics].forEach(view.addSubview)
        uiViewStadistics.addSubview(stackVerticalStadistics)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            labelMoveName.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            labelMoveName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelMoveName.bottomAnchor.constraint(equalTo: moveDescription
                .topAnchor),
            
            moveDescription.topAnchor.constraint(equalTo: labelMoveName.bottomAnchor, constant: 60),
            moveDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            moveDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            moveDescription.bottomAnchor.constraint(equalTo: stackHorizontal.topAnchor),
            
            stackHorizontal.topAnchor.constraint(equalTo: moveDescription.bottomAnchor, constant: 10),
            stackHorizontal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackHorizontal.bottomAnchor.constraint(equalTo: stackVerticalStadistics.topAnchor),
            
            uiViewStadistics.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiViewStadistics.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiViewStadistics.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            uiViewStadistics.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            stackHorizontalStadisticsValue.leadingAnchor.constraint(equalTo: stackVerticalStadistics.leadingAnchor, constant: 20),
            stackHorizontalStadisticsValue.trailingAnchor.constraint(equalTo: stackVerticalStadistics.trailingAnchor, constant: -20),
        ])
    }
}
