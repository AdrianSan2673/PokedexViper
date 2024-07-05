//
//  PokemonListView.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 29/05/23.
//

import Foundation
import UIKit

class PokemonListView: UIViewController {

    var myCellWidth = UIScreen.main.bounds.width / 2
    
    var pokemonRegions = ["Kanto","Johto","Hoenn","Sinnoh","Teselia","Kalos","Alola","Galar","Paldea"]
    
    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    
    lazy var labelQuestion: UILabel = {
        let label = UILabel()
        label.text = "What Pokemon \nare you looking for?"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var labelRegion: UILabel = {
        let label = UILabel()
        label.text = "Regions"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var labelGeneration: UILabel = {
        let label = UILabel()
        label.text = "First generation"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var txtSearch: UITextField = {
        var imageView = UIImageView()
        var image = UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = image
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightGray
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.placeholder = "  Search"
        textField.leftView = imageView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var pokemonTable: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 200, height: 150)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PokemonListViewCell.self, forCellWithReuseIdentifier: "PokemonListViewCell")
        return collectionView
    }()
    
    lazy var regionTable: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 150)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PokemonRegionViewCell.self, forCellWithReuseIdentifier: "PokemonRegionViewCell")
        return collectionView
    }()
    
    lazy var errorView: UIView = {
        let view = UIView()
        let image = UIImageView()
        let label = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "sleeping")
        image.heightAnchor.constraint(equalToConstant: 127).isActive = true
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        label.text = "Pokemon Data Unavaible"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .bold)
        
        [image, label].forEach(view.addSubview)
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            label.centerXAnchor.constraint(equalTo: image.centerXAnchor)
        ])
        return view
    }()
    
    let presenter: PokemonListPresentable
    
    init(presenter: PokemonListPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        presenter.onViewAppear()
        regionTable.dataSource = self
        regionTable.delegate = self
        pokemonTable.dataSource = self
        pokemonTable.delegate = self
        txtSearch.delegate = self
    }
}


