//
//  PokemonListPresenter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 29/05/23.
//

import Foundation

protocol PokemonListPresentable: AnyObject {
    var ui: PokemonListUI? {get}
    var viewModels: [PokemonListViewModel] {get}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

protocol PokemonListUI: AnyObject {
    func update(pokemons: [PokemonListViewModel])
}

class PokemonListPresenter: PokemonListPresentable {
    
    weak var ui: PokemonListUI?
    
    private let pokemonListInteractor: PokemonListInteractable
    var viewModels: [PokemonListViewModel] = []
    private var models: [PokemonListEntity] = []
    private let mapper: PokemonListMapper
    private let router: PokemonListRouting
    
    init(pokemonListInteractor: PokemonListInteractable,
         mapper: PokemonListMapper = PokemonListMapper(),
         router: PokemonListRouting){
        self.pokemonListInteractor = pokemonListInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            models = try await pokemonListInteractor.getPokemonListInteractor()
            viewModels = models.map(mapper.map(entity:))
            ui?.update(pokemons: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let pokemonId = models[atIndex].id ?? 0
        router.showPokemonDetail(whitPokemonId: pokemonId)
        //router.showPokemonDetail(withPokemonId: pokemonId?.description)
    }
}
