//
//  PokemonListRouter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 29/05/23.
//

import Foundation
import UIKit

protocol PokemonListRouting: AnyObject {
    var detailRouter: PokemonDetailRouting? { get }
    var pokemonListView: PokemonListView? { get }
    
    func showPokemonList(window: UIWindow?)
    func showPokemonDetail(whitPokemonId pokemonId: Int)

}

class PokemonListRouter: PokemonListRouting {
        
    var detailRouter: PokemonDetailRouting?
    
    var pokemonListView: PokemonListView?
    
    func showPokemonList(window: UIWindow?) {
        self.detailRouter = PokemonDetailRouter()
        let interactor = PokemonListInteractor()
        let presenter = PokemonListPresenter(pokemonListInteractor: interactor, router: self)
        pokemonListView = PokemonListView(presenter: presenter)
        presenter.ui = pokemonListView
        if let navigationController = pokemonListView?.navigationController {
                    // pokemonListView is already embedded in a navigation controller
                    window?.rootViewController = navigationController
                } else {
                    // Embed pokemonListView in a navigation controller
                    let navController = UINavigationController(rootViewController: pokemonListView!)
                    window?.rootViewController = navController
                }
                window?.makeKeyAndVisible()
    }
    
    func showPokemonDetail(whitPokemonId pokemonId: Int) {
        guard let fromViewController = pokemonListView else {
            return
        }
        detailRouter?.showDetail(fromViewController: fromViewController, withPokemon: pokemonId)
    }
}
