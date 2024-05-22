//
//  MovesModuleRouter.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation
import UIKit

protocol MovesModuleRouting: AnyObject {
    func showMoves(fromViewController: UIViewController, withMoveId: String)
}

class MovesModuleRouter: MovesModuleRouting {
    func showMoves(fromViewController: UIViewController, withMoveId: String) {
        print("Attempting to show moves module with Move ID: \(withMoveId)")
        let interactor = MovesModuleInteractor()
        let presenter = MovesModulePresenter(moveId: withMoveId, interactor: interactor, mapper: MovesModuleMapper())
        let view = MovesModuleView(presenter: presenter)
        presenter.ui = view
        print("Presenting MovesModuleView from \(fromViewController)")
        fromViewController.present(view, animated: true){
            print("MovesModuleView presented successfully")
        }
    }
}
