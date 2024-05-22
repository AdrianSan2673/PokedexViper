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
    var pokemonId: Int {get}
    
    func onViewAppear()
    func onTapCell(move: String)
}

class PokemonDetailPresenter: PokemonDetailPresentable {
    
    var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()
    weak var ui: PokemonDetailPresenterUI?
    
    var pokemonId: Int
    private let interactor: PokemonDetailInteractable
    private let mapper: PokemonDetailMapper
    private let router: PokemonDetailRouting
    
    init(pokemonId: Int, Interactor: PokemonDetailInteractable, mapper: PokemonDetailMapper, router: PokemonDetailRouter) {
        self.pokemonId = pokemonId
        self.interactor = Interactor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getPokemonDetail(withId: pokemonId)
            viewModel = mapper.map(entity: model)
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                
            }
        }
    }
    
    func onTapCell(move: String) {
        print("va al router para preparar el pase")
        router.showMovesModule(movesId: move)
    }
}
