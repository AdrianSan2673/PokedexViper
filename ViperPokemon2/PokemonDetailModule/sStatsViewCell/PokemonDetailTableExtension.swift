//
//  PokemonDetailTableExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 14/05/24.
//

import Foundation
import UIKit

extension PokemonDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableStats {
            return presenter.viewModel.stats?.count ?? 1
        }
        else if tableView == tableMoves {
            return presenter.viewModel.moves?.count ?? 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableStats {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatsViewCell", for: indexPath) as? StatsViewCell else {
                return .init()
            }
            if let model = presenter.viewModel.stats?[indexPath.row] {
                cell.setBackgroundColorTypePokemon(pokemonType: presenter.viewModel.types?[0].type?.name ?? "water")
                cell.configure(model: model)
            }
            return cell
        } else if tableView == tableMoves {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovesTableViewCell", for: indexPath) as? MovesTableViewCell else {
                return .init()
            }
            if let model = presenter.viewModel.moves?[indexPath.row] {
                cell.configure(model: model)
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension PokemonDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableStats {
            print("tableStats")
        } else if tableView == tableMoves {
            let move = presenter.viewModel.moves?[indexPath.row].move?.url ?? ""
            print("selecciona un movimiento")
            presenter.onTapCell(move: move)
        }
    }
}
