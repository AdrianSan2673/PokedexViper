//
//  MovesModuleExtension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 20/05/24.
//

import Foundation
import UIKit

extension MovesModuleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.viewModel.arrayEstadistcs?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonRegionViewCell", for: indexPath) as? PokemonRegionViewCell else { return .init()}
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        if let stadistics = presenter.viewModel.arrayEstadistcs?[indexPath.row] {
            cell.configure(region: stadistics)
        }
        return cell
    }
}

extension MovesModuleView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 50, height: 150.0)
    }
}

extension MovesModuleView: MovesModulePresenterUI {
    func updateUI(viewModel: MovesModuleViewModel) {
        self.labelMoveName.text = viewModel.name
        self.moveDescription.text = viewModel.effectEntries
        DispatchQueue.main.async {
            self.collectionMoveStadistic.reloadData()
        }
    }
}
