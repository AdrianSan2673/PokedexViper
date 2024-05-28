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
        if collectionView == regionTable {
            return self.pokemonRegions.count
        } else if collectionView == pokemonTable {
            return presenter.viewModels.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == regionTable {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonRegionViewCell", for: indexPath) as? PokemonRegionViewCell else { return UICollectionViewCell() }
            cell.backgroundColor = .green
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            let region = pokemonRegions[indexPath.row]
            cell.configure(region: region)
            return cell
        } else if collectionView == pokemonTable {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonListViewCell", for: indexPath) as? PokemonListViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            let model = presenter.viewModels[indexPath.row]
            cell.configure(model: model)
            return cell
        }  else {
            return UICollectionViewCell()
        }
    }
}

extension PokemonListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == regionTable {
            presenter.onTapCellRegion(atIndex: indexPath.row)
        } else if collectionView == pokemonTable {
            presenter.onTapCell(atIndex: indexPath.row)
        }
    }
}

extension PokemonListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == regionTable {
            return CGSize(width: myCellWidth - 90.0, height: 50.0)
        } else if collectionView == pokemonTable {
            return CGSize(width: myCellWidth - 10.0, height: 150.0)
        } else {
            return CGSize(width: myCellWidth - 10.0, height: 150.0)
        }
    }
}

extension PokemonListView: PokemonListUI{
    func update(pokemons: [PokemonListViewModel]) {
        DispatchQueue.main.async {
            self.pokemonTable.reloadData()
            self.regionTable.reloadData()
        }
    }
}
