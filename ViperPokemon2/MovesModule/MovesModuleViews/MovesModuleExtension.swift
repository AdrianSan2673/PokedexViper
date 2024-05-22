//
//  MovesModuleExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 20/05/24.
//

import Foundation

extension MovesModuleView: MovesModulePresenterUI {
    func updateUI(viewModel: MovesModuleViewModel) {
        self.labelMoveName.text = viewModel.name
        self.moveDescription.text = "Definition:" + "\n" + (viewModel.effectEntries?.first?.effect ?? "No found") + "\n"
            
        self.labelPP.text = "PP: \(viewModel.pp ?? 0)"
        self.labelPower.text = "Power: \(viewModel.power ?? 0)"
        self.labelPriority.text = "Prioriry: \(viewModel.priority ?? 0)"
        self.labelCritRateValue.text = "\(viewModel.meta?.critRate ?? 0)"
        self.labelDrainValue.text = "\(viewModel.meta?.drain ?? 0)"
        self.labelFlinchChanceValue.text = "\(viewModel.meta?.flinchChance ?? 0)"
       
    }
}
