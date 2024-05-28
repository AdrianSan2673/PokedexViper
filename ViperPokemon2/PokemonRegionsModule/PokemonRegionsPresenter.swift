//
//  PokemonRegionsPresenter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation
import UIKit

protocol PokemonRegionsPresenterUI: AnyObject {
    func updateUI(viewModel: PokemonRegionsViewModel)
}

protocol PokemonRegionsPresentable: AnyObject {
    var ui: PokemonRegionsPresenterUI? {get}
    var viewModel: PokemonRegionsViewModel {get}
    var pokemonRegionId: Int {get}
    
    func onViewAppear()
}

class PokemonRegionsPresenter: PokemonRegionsPresentable {
    
    weak var ui: PokemonRegionsPresenterUI?
    var viewModel: PokemonRegionsViewModel = PokemonRegionsViewModel()
    
    var pokemonRegionId: Int
    private let interactor: PokemonRegionsInteractable
    private let mapper: PokemonRegionsMapper
    private let router: PokemonRegionsRouting
    
    init(pokemonRegionId: Int, interactor: PokemonRegionsInteractable, mapper: PokemonRegionsMapper, router: PokemonRegionsRouter) {
        self.pokemonRegionId = pokemonRegionId
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getPokemonRegionsInteractor(region: pokemonRegionId)
            viewModel = mapper.map(entity: model)
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
            }
        }
    }
}
