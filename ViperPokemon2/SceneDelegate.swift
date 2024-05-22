//
//  SceneDelegate.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 29/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var pokemonListRouter = PokemonListRouter()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        pokemonListRouter.showPokemonList(window: window)
    }
}
