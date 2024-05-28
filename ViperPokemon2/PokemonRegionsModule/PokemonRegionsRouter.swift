//
//  PokemonRegionsRouter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation
import UIKit

protocol PokemonRegionsRouting: AnyObject {
    //var pokemonDetailRouter: PokemonDetailRouting? {get} (EN CASO DE AGREGAR EL DETALLE DE ESPECIE)
    var pokemonRegionsView: PokemonRegionsView? {get}
    
    func showPokemonRegions(fromViewController: UIViewController, regionId: Int)
    //func showPokemonDetailEspecie  (EN CASO DE AGRGAR EL DETALLE DE ESPECIE)
}

class PokemonRegionsRouter: PokemonRegionsRouting {
    
    var pokemonRegionsView: PokemonRegionsView?
    
    func showPokemonRegions(fromViewController: UIViewController, regionId: Int) {
        let interactor = PokemonRegionsInteractor()
        let presenter = PokemonRegionsPresenter(pokemonRegionId: regionId, interactor: interactor, mapper: PokemonRegionsMapper(), router: self)
        self.pokemonRegionsView = PokemonRegionsView(presenter: presenter)
        presenter.ui = pokemonRegionsView
        
        if let navigationController = fromViewController.navigationController{
            navigationController.pushViewController(self.pokemonRegionsView ?? PokemonRegionsView(presenter: presenter
                                                                                                 ), animated: true)
        } else {
            print("Error: fromViewController is not embedded in a navigation controller.")
        }
    }
}
