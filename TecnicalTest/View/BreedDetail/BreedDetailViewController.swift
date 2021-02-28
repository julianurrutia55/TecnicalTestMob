//
//  BreedDetailViewController.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 27/02/21.
//

import UIKit
import Kingfisher

class BreedDetailViewController: UIViewController {


    private var breed: Breed
    
    init(breed: Breed) {
        self.breed = breed
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstraints()
        setData(break: breed)
    }
    
    private func setUpView(){
        view.backgroundColor = UIColor.white
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageBreed)
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
    
    func setData(break: Breed)  {
        configure(breed.image?.url ?? "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg", imageBreed: imageBreed)
        desLabel.text = breed.description
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
    
    private let imageBreed: UIImageView = {
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
    
    
    
    func configure(_ url: String, imageBreed: UIImageView) {
        let scale = UIScreen.main.scale
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 100.0 * scale, height: 100.0 * scale))
        let url = URL(string: url)
        imageBreed.kf.indicatorType = .activity
        imageBreed.kf.setImage(with: url,
                              options: [.processor(resizingProcessor)],
                              completionHandler: { [ weak self] image, error, cacheType, imageURL in
                                  self?.imageBreed.layer.shadowOpacity = 0.5
                              }
        )
    }
    
}
