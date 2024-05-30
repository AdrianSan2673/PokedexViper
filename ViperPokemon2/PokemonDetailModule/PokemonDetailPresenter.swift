//
//  PokemonDetailPresenter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation
import UIKit

protocol PokemonDetailPresenterUI: AnyObject{
    func updateUI(viewModel: PokemonDetailViewModel)
    func setBackgroundColorDetail(pokemonType: String)
}

protocol PokemonDetailPresentable: AnyObject {
    var ui: PokemonDetailPresenterUI? {get}
    var viewModel : PokemonDetailViewModel {get}
    var pokemonId: String {get}
    var evolutionChain: [EvolutionChain] {get}
    
    func onViewAppear()
    func onTapCell(move: String)
}

class PokemonDetailPresenter: PokemonDetailPresentable {
    
    var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()
    weak var ui: PokemonDetailPresenterUI?
    
    var pokemonId: String
    var evolutionChain: [EvolutionChain]
    private let interactor: PokemonDetailInteractable
    private let mapper: PokemonDetailMapper
    private let router: PokemonDetailRouting
    
    init(pokemonId: String, Interactor: PokemonDetailInteractable, mapper: PokemonDetailMapper, router: PokemonDetailRouter, evolutionChain: [EvolutionChain]) {
        self.pokemonId = pokemonId
        self.interactor = Interactor
        self.mapper = mapper
        self.router = router
        self.evolutionChain = evolutionChain
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getPokemonDetail(withId: "\(pokemonId)")
            viewModel = mapper.map(entity: model)
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.router.dismissLoading()
                })
            }
        }
    }
    
    func onTapCell(move: String) {
        print("va al router para preparar el pase")
        router.showMovesModule(movesId: move)
    }
}
