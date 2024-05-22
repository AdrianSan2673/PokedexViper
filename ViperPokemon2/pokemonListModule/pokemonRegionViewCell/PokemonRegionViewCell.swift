//
//  PokemonRegionViewCell.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 22/05/24.
//

import Foundation
import UIKit

class PokemonRegionViewCell: UICollectionViewCell {
    
    lazy var labelRegionName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageRegion: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "globe.americas.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
