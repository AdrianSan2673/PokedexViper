//
//  MovesModulePresenter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation
import UIKit
protocol MovesModulePresenterUI: AnyObject {
    func updateUI(viewModel: MovesModuleViewModel)
    
}

protocol MovesModulePresentable: AnyObject {
    var ui: MovesModulePresenterUI? {get}
    var moveId: String {get}
    var viewModel: MovesModuleViewModel {get}
    func onViewAppear()
}

class MovesModulePresenter: MovesModulePresentable {

    var viewModel: MovesModuleViewModel = MovesModuleViewModel()
    weak var ui: MovesModulePresenterUI?
    var moveId: String
    
    private let interactor: MovesModuleInteractable
    private let mapper: MovesModuleMapper
    
    
    init(moveId: String, interactor: MovesModuleInteractable, mapper: MovesModuleMapper){
        self.moveId = moveId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await self.interactor.getMovesDetails(id: self.moveId)
            viewModel = mapper.map(entity: model)
            await MainActor.run {
                ui?.updateUI(viewModel: viewModel)
                print("Pokemon Moves \(viewModel)")
            }
        }
    }
}
