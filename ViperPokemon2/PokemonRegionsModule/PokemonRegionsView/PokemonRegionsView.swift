//
//  PokemonRegionsView.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 27/05/24.
//

import Foundation
import UIKit

class PokemonRegionsView: UIViewController {
    let presenter: PokemonRegionsPresentable
    
    lazy var imagePokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var tablePokemonRegion: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.register(MovesTableViewCell.self, forCellReuseIdentifier: "MovesTableViewCell")
        return tableView
    }()
    
    init(presenter: PokemonRegionsPresentable) {
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
        tablePokemonRegion.dataSource = self
        tablePokemonRegion.delegate = self
    }
}
