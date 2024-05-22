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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonTypeViewCell", for: indexPath) as? PokemonTypeViewCell else {
            return .init()
        }
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.backgroundColor = .red
        if let model = presenter.viewModel.types?[indexPath.row] {
            cell.configure(model: model)
        }
        return cell
    }
}

extension PokemonDetailView: UICollectionViewDelegate {
    
}

extension PokemonDetailView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 132, height: 30)
    }
}
