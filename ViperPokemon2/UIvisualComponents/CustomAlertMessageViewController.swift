//
//  CustomAlertMessageViewController.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 30/05/24.
//

import Foundation
import UIKit

protocol CustomAlertDelegate{
    func onClick(_ customAlertViewController: CustomAlertMessageViewController)
    func onClose(_ customAlertViewController: CustomAlertMessageViewController)
}

class CustomAlertMessageViewController: UIViewController{
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var verticalContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buttonAction: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_close"), for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonAccept: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor
        
        let button = UIButton()
        button.configuration = configuration
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "Back"
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    lazy var sectionTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageAlert: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "exclamationmark.triangle.fill")
        image.isHidden = false
        return image
    }()
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var labelDescription: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    private var ModalTitle: String?
    private var ModalDescription: String?
    private var buttonTitle: String?
    var customAlertDelegate: CustomAlertDelegate?
    
    @objc func actionButton() {
        dismiss(animated: true)
        self.customAlertDelegate?.onClose(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    init(ModalTitle: String? = nil, ModalDescription: String? = nil, buttonTitle: String? = nil, customAlertDelegate: CustomAlertDelegate? = nil) {
        self.ModalTitle = ModalTitle
        self.ModalDescription = ModalDescription
        self.buttonTitle = buttonTitle
        self.customAlertDelegate = customAlertDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addsubViews()
        setupConstraints()
        configureText()
    }
    
    func addsubViews(){
        [backgroundView,containerView].forEach(view.addSubview)
        [verticalContainer,buttonAction].forEach(containerView.addSubview)
        [imageAlert,labelTitle].forEach(sectionTitleView.addSubview)
        layoutAlertButton()
        [sectionTitleView,labelDescription,buttonAccept].forEach(verticalContainer.addArrangedSubview)
    }
    
    func layoutAlertButton(){
        NSLayoutConstraint.activate([
            imageAlert.leadingAnchor.constraint(equalTo: sectionTitleView.leadingAnchor),
            imageAlert.topAnchor.constraint(equalTo: sectionTitleView.topAnchor),
            imageAlert.bottomAnchor.constraint(equalTo: sectionTitleView.bottomAnchor),
            imageAlert.widthAnchor.constraint(equalToConstant: 100),
            imageAlert.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
          
            buttonAction.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
            buttonAction.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            buttonAction.heightAnchor.constraint(equalToConstant: 12),
            buttonAction.widthAnchor.constraint(equalToConstant: 12),
            
            labelTitle.leadingAnchor.constraint(equalTo: imageAlert.trailingAnchor, constant: 30),
            labelTitle.centerYAnchor.constraint(equalTo: sectionTitleView.centerYAnchor),
            
            verticalContainer.topAnchor.constraint(equalTo: buttonAction.bottomAnchor, constant: 10),
            verticalContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23),
            verticalContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -23),
            verticalContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -23),
        ])
    }
    
    func configureText(){
        labelTitle.text = ModalTitle
        labelDescription.text = ModalDescription
        //buttonTitle.text = buttonTitle
    }
}
