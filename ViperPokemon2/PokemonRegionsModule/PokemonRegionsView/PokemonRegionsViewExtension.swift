//
//  PokemonRegionsViewExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation
import UIKit

extension PokemonRegionsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModel.pokemonEntries?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovesTableViewCell", for: indexPath) as? MovesTableViewCell else {
            return .init()
        }
        if let model = presenter.viewModel.pokemonEntries?[indexPath.row] {
            cell.configureRegions(model: model)
        }
        return cell
    }
}

extension PokemonRegionsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension PokemonRegionsView: PokemonRegionsPresenterUI {
    func errorMessage() {
        DispatchQueue.main.async {
            let customAlert = CustomAlertMessageViewController(ModalTitle: "No found",ModalDescription: "Unavaible data",buttonTitle: "Accept",customAlertDelegate: self)
            customAlert.modalPresentationStyle = .custom
            self.present(customAlert, animated: true)
        }
    }
    
    func updateUI(viewModel: PokemonRegionsViewModel) {
        switch presenter.pokemonRegionId {
        case 0:
            imagePokemon.image = UIImage(named: "kanto")
        case 1:
            imagePokemon.image = UIImage(named: "johto")
        case 2:
            imagePokemon.image = UIImage(named: "hoenn")
        case 3:
            imagePokemon.image = UIImage(named: "sinnoh")
        case 4:
            imagePokemon.image = UIImage(named: "teselia")
        case 5:
            imagePokemon.image = UIImage(named: "kalos")
        case 6:
            imagePokemon.image = UIImage(named: "alola")
        case 7:
            imagePokemon.image = UIImage(named: "galar")
        case 8:
            imagePokemon.image = UIImage(named: "paldea")
        default:
            imagePokemon.image = UIImage(named: "kanto")
        }
        DispatchQueue.main.async {
            self.tablePokemonRegion.reloadData()
        }
    }
}

extension PokemonRegionsView: CustomAlertDelegate {
    func onClick(_ customAlertViewController: CustomAlertMessageViewController) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func onClose(_ customAlertViewController: CustomAlertMessageViewController) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
