//
//  MovesModuleView.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation
import UIKit

class MovesModuleView: UIViewController {
    let presenter: MovesModulePresentable
    var myCellWidth = UIScreen.main.bounds.width / 2
    lazy var labelMoveName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var moveDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.numberOfLines = 10
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var collectionMoveStadistic: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 40)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PokemonRegionViewCell.self, forCellWithReuseIdentifier: "PokemonRegionViewCell")
        return collection
    }()
    
    init(presenter: MovesModulePresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        presenter.onViewAppear()
        collectionMoveStadistic.dataSource = self
    }
}
