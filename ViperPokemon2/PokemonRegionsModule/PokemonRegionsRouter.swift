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
    
    func routeToLoading()
    func dismissLoading()
}

class PokemonRegionsRouter: PokemonRegionsRouting {
    
    var pokemonDetailRouter: PokemonDetailRouting?
    var pokemonRegionsView: PokemonRegionsView?
    
    var loadingViewController: UILoadingModalViewController?
    
    func showPokemonRegions(fromViewController: UIViewController, regionId: Int) {
        DispatchQueue.main.async {
            self.routeToLoading()
        }
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
    
    func routeToLoading() {
        loadingViewController = UILoadingModalViewController()
        let dialogInfo = UILoadingModalViewController.DialogInfo(title: "Loading...", description: "Fetch Pokemon Data")
        loadingViewController?.dialogInfo = dialogInfo
        loadingViewController?.providesPresentationContextTransitionStyle = true
        loadingViewController?.definesPresentationContext = true
        loadingViewController?.modalPresentationStyle = .overFullScreen
        loadingViewController?.modalTransitionStyle = .crossDissolve
        if let loadingViewController = self.loadingViewController {
            pokemonRegionsView?.parent?.present(loadingViewController, animated: true)
        }
    }
    
    func dismissLoading() {
        if let loadingViewController = self.loadingViewController {
            loadingViewController.dismiss(animated: true, completion: nil)
            self.loadingViewController = nil
        }
    }
}
