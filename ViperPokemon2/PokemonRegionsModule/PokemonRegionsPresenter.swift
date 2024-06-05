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
    func errorMessage()
}

protocol PokemonRegionsPresentable: AnyObject {
    var ui: PokemonRegionsPresenterUI? {get}
    var viewModel: PokemonRegionsViewModel {get}
    var pokemonRegionId: Int {get}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
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
            do {
                let model = try await interactor.getPokemonRegionsInteractor(region: pokemonRegionId)
                viewModel = mapper.map(entity: model)
                await MainActor.run {
                    self.ui?.updateUI(viewModel: viewModel)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        self.router.dismissLoading()
                    })
                }
            } catch {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                    self.router.dismissLoading()
                    self.ui?.errorMessage()
                })
            }
        }
    }
    
    func onTapCell(atIndex: Int){
        let pokemonName = viewModel.pokemonEntries?[atIndex].pokemonSpecies?.name ?? "NA"
        router.showPokemonDetailRegions(pokemonName: pokemonName, evolutionChain: [EvolutionChain(id: "NA",name: "NA")])
    }
}
