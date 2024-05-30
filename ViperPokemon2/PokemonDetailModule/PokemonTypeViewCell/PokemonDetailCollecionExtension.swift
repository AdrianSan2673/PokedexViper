//
//  PokemonDetailCollecionExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 14/05/24.
//

import Foundation
import UIKit

extension PokemonDetailView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.viewModel.types?.count ?? 1
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionType {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonTypeViewCell", for: indexPath) as? PokemonTypeViewCell else {
                return .init()
            }
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            if let model = presenter.viewModel.types?[indexPath.row] {
                cell.configure(model: model)
            }
            return cell
        } else if collectionView == collectionEvolution {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonRegionViewCell", for: indexPath) as? PokemonRegionViewCell else {
                return .init()
            }
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            if let model = presenter.evolutionChain[indexPath.row].name {
                cell.configure(region: model)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension PokemonDetailView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionType {
            return CGSize(width: 132, height: 30)
        } else if collectionView == collectionEvolution {
            return CGSize(width: 150, height: 100)
        } else {
            return CGSize(width: 132, height: 30)
        }
    }
}
