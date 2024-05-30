//
//  PokemonRegionsRouter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation
import UIKit

protocol PokemonRegionsRouting: AnyObject {
    var pokemonDetailRouter: PokemonDetailRouting? {get}
    var pokemonRegionsView: PokemonRegionsView? {get}
    
    func showPokemonRegions(fromViewController: UIViewController, regionId: Int)
    
    func showPokemonDetailRegions(pokemonName: String, evolutionChain: [EvolutionChain])
}

class PokemonRegionsRouter: PokemonRegionsRouting {
    
    var pokemonDetailRouter: PokemonDetailRouting?
    var pokemonRegionsView: PokemonRegionsView?
    
    func showPokemonRegions(fromViewController: UIViewController, regionId: Int) {
        self.pokemonDetailRouter = PokemonDetailRouter()
        let interactor = PokemonRegionsInteractor()
        let presenter = PokemonRegionsPresenter(pokemonRegionId: regionId, interactor: interactor, mapper: PokemonRegionsMapper(), router: self)
        self.pokemonRegionsView = PokemonRegionsView(presenter: presenter)
        presenter.ui = pokemonRegionsView
        if let navigationController = fromViewController.navigationController{
            navigationController.pushViewController(self.pokemonRegionsView ?? PokemonRegionsView(presenter: presenter), animated: true)
        } else {
            print("Error: fromViewController is not embedded in a navigation controller.")
        }
    }
    
    func showPokemonDetailRegions(pokemonName: String, evolutionChain: [EvolutionChain]) {
        guard let fromViewController = pokemonRegionsView else {
            return
        }
        pokemonDetailRouter?.showDetail(fromViewController: fromViewController, withPokemon: pokemonName, evolutionChain: [EvolutionChain(id: "NA",name: "NA"),EvolutionChain(id: "NA",name: "NA")])
    }
}
