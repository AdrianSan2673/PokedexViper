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
    var regionsRouter: PokemonRegionsRouting? {get}
    var pokemonListView: PokemonListView? { get }
    
    func showPokemonList(window: UIWindow?)
    func showPokemonDetail(whitPokemonId pokemonId: String,evolutionChain: [EvolutionChain])
    func showPokemonRegions(regionId: Int)
    
    func routeToLoading()
    func dismissLoading()
}

class PokemonListRouter: PokemonListRouting {

    var regionsRouter: PokemonRegionsRouting?

    var detailRouter: PokemonDetailRouting?
    
    var pokemonListView: PokemonListView?
    
    var loadingViewController: UILoadingModalViewController?
    func showPokemonList(window: UIWindow?) {
       
        self.detailRouter = PokemonDetailRouter()
        self.regionsRouter = PokemonRegionsRouter()
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
    
    func showPokemonDetail(whitPokemonId pokemonId: String,evolutionChain: [EvolutionChain]) {
        guard let fromViewController = pokemonListView else {
            return
        }
        detailRouter?.showDetail(fromViewController: fromViewController, withPokemon: pokemonId, evolutionChain: evolutionChain)
    }
    
    func showPokemonRegions(regionId: Int) {
        guard let fromViewController = pokemonListView else {
            return
        }
        regionsRouter?.showPokemonRegions(fromViewController: fromViewController, regionId: regionId)
    }
    
    func routeToLoading() {
        loadingViewController = UILoadingModalViewController()
        let dialogInfo = UILoadingModalViewController.DialogInfo(title: "Loading...",description: "Fetch Pokemon Data")
        loadingViewController?.dialogInfo = dialogInfo
        loadingViewController?.providesPresentationContextTransitionStyle = true
        loadingViewController?.definesPresentationContext = true
        loadingViewController?.modalPresentationStyle = .overFullScreen
        loadingViewController?.modalTransitionStyle = .crossDissolve
        if let loadingViewController = self.loadingViewController{
            pokemonListView?.parent?.present(loadingViewController, animated: true)
        }
    }
    
    func dismissLoading() {
        if let loadingViewController = self.loadingViewController {
            loadingViewController.dismiss(animated: true)
            self.loadingViewController = nil
        }
    }
}
