//
//  PokemonDetailRouter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation
import UIKit

protocol PokemonDetailRouting: AnyObject {
    var movesRouter: MovesModuleRouting? {get}
    var pokemonDetail: PokemonDetailView? {get}
    
    func showDetail(fromViewController: UIViewController, withPokemon pokemonId: String, evolutionChain: [EvolutionChain])
    func showMovesModule(movesId: String)
    
    func routeToLoading()
    func dismissLoading()
}

class PokemonDetailRouter: PokemonDetailRouting {
    var pokemonDetail: PokemonDetailView?

    var movesRouter: MovesModuleRouting?
    
    var loadingViewController: UILoadingModalViewController?
    
    func showDetail(fromViewController: UIViewController, withPokemon pokemonId: String, evolutionChain: [EvolutionChain]) {
        DispatchQueue.main.async {
            self.routeToLoading()
        }
        self.movesRouter = MovesModuleRouter()
        let interactor = PokemonDetailInteractor()
        let presenter = PokemonDetailPresenter(pokemonId: "\(pokemonId)", Interactor: interactor, mapper: PokemonDetailMapper(), router: self, evolutionChain: evolutionChain)
        self.pokemonDetail = PokemonDetailView(presenter: presenter)
        presenter.ui = pokemonDetail
        
        if let navigationController = fromViewController.navigationController {
            navigationController.pushViewController(self.pokemonDetail ?? PokemonDetailView(presenter: presenter), animated: true)
        } else {
            print("Error: fromViewController is not embedded in a navigation controller.")
        }
    }
    
    func showMovesModule(movesId: String) {
        guard let fromViewController = self.pokemonDetail else {
            print("Error: pokemonDetail is nil or not embedded in a navigation controller.")
            return
        }
        print("pasa al asiguiente router")
        movesRouter?.showMoves(fromViewController: fromViewController, withMoveId: movesId)
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
            pokemonDetail?.parent?.present(loadingViewController, animated: true)
        }
    }
    
    func dismissLoading() {
        if let loadingViewController = self.loadingViewController {
            loadingViewController.dismiss(animated: true,completion: nil)
            self.loadingViewController = nil
        }
    }
}
