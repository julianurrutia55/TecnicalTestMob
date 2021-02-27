//
//  BreedDetailViewController.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 27/02/21.
//

import UIKit

class BreedDetailViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstraints()
    }
    
    private func setUpView(){
        view.backgroundColor = UIColor.white
        view.addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(desLabel)
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
                
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10)
        ])
       
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let image: UIImageView = {
        let img = UIImageView()
        let image = UIImage(named: "1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let desLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "estos es una prueba para saber como se comportan las vistas en ios, si toca ponerle mas estilos "
        label.numberOfLines = 0
        return label
    }()
    
}
