//
//  PokemonDetailView.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 07/05/24.
//

import Foundation
import UIKit
import Kingfisher

class PokemonDetailView: UIViewController {
    let presenter: PokemonDetailPresentable
    
    lazy var imagePokemon : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var viewStadistic: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    
    lazy var labelPokemonName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var collectionType: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PokemonTypeViewCell.self, forCellWithReuseIdentifier: "PokemonTypeViewCell")
        return collectionView
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        var segmentControl = UISegmentedControl(items: ["Stats","Moves","Evolutions"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.addTarget(self, action: #selector(changeInformation), for: .valueChanged)
        return segmentControl
    }()
    
    lazy var viewStats: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        return view
    }()
    
    lazy var tableStats: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.register(StatsViewCell.self, forCellReuseIdentifier: "StatsViewCell")
        return tableView
    }()
    
    lazy var viewMoves: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    
    lazy var tableMoves: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.register(MovesTableViewCell.self, forCellReuseIdentifier: "MovesTableViewCell")
        return tableView
    }()
    
    lazy var viewEvolutions: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionEvolution: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 200, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PokemonRegionViewCell.self, forCellWithReuseIdentifier: "PokemonRegionViewCell")
        return collectionView
    }()
    
    init(presenter: PokemonDetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIU()
        presenter.onViewAppear()
        collectionType.dataSource = self
        collectionType.delegate = self
        tableStats.dataSource = self
        tableMoves.dataSource = self
        tableMoves.delegate = self
        collectionEvolution.dataSource = self
        collectionEvolution.delegate = self
    }
    
    @objc private func changeInformation(){
        switch segmentControl.selectedSegmentIndex {
        case 0:
            self.viewStats.isHidden = false
            self.viewMoves.isHidden = true
            self.viewEvolutions.isHidden = true
        case 1:
            self.viewStats.isHidden = true
            self.viewMoves.isHidden = false
            self.viewEvolutions.isHidden = true
        case 2:
            self.viewStats.isHidden = true
            self.viewMoves.isHidden = true
            self.viewEvolutions.isHidden = false
        default:
            self.viewStats.isHidden = false
            self.viewMoves.isHidden = true
            self.viewEvolutions.isHidden = true
        }
    }
}
