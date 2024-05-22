//
//  PokemonListViewExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 15/05/24.
//

import Foundation
import UIKit

extension PokemonListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonListViewCell", for: indexPath) as? PokemonListViewCell else { return .init() }
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        let model = presenter.viewModels[indexPath.row]
        cell.configure(model: model)
        return cell
    }
}

extension PokemonListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension PokemonListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth - 10.0, height: 150.0)
    }
}

extension PokemonListView: PokemonListUI{
    func update(pokemons: [PokemonListViewModel]) {
        DispatchQueue.main.async {
            self.pokemonTable.reloadData()
        }
    }
}
