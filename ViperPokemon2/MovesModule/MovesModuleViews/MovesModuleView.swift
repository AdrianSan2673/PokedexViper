//
//  MovesModuleView.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 16/05/24.
//

import Foundation
import UIKit

class MovesModuleView: UIViewController {
    private let presenter: MovesModulePresentable
    
    lazy var labelMoveName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stackHorizontal: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var labelPriority: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.backgroundColor = Utils.shared.hexStringToUIColor(hex: "93F3F0")
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var labelPower: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = Utils.shared.hexStringToUIColor(hex: "BDF393")
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.purple.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var labelPP: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = Utils.shared.hexStringToUIColor(hex: "AD93F3")
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var moveDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 7
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var labelCritRate : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.text = "Crit rate"
        return label
    }()
    
    lazy var labelDrain : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.text = "Drain"
        return label
    }()
    
    lazy var labelFlinchChance : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.text = "Flinch chance"
        return label
    }()
    
    lazy var labelCritRateValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var labelDrainValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var labelFlinchChanceValue : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var uiViewStadistics: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        //view.layer.masksToBounds = true
        //view.layer.shadowColor = UIColor.black.cgColor
        //view.layer.shadowOpacity = 1
        //view.layer.shadowOffset = .zero
        //view.layer.shadowRadius = 10
        //view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    lazy var stackVerticalStadistics: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.cornerRadius = 10
        stack.layer.masksToBounds = true
        return stack
    }()
    
    lazy var stackHorizontalStadisticsTitle: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var stackHorizontalStadisticsValue: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    }
}
