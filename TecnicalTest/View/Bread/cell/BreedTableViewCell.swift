//
//  BreedTableViewCell.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 27/02/21.
//

import UIKit
import Kingfisher

class BreedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpConstraints() {
        contentView.addSubview(breedNameLabel)
        contentView.addSubview(breedNameDesLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(countryDesLabel)
        contentView.addSubview(imageBreed)
       
        let constraintsBreedNameLabel = [
            breedNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            breedNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
        ]
        
        let constraintsBreedNameDesLabel = [
            breedNameDesLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            breedNameDesLabel.leadingAnchor.constraint(equalTo: breedNameLabel.trailingAnchor, constant: 5),
            breedNameDesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ]
        
        let constraintsArrowIcon = [
            imageBreed.topAnchor.constraint(equalTo: breedNameDesLabel.bottomAnchor, constant: 10),
            imageBreed.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            imageBreed.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            imageBreed.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let constraintsCountryLabel = [
            countryLabel.topAnchor.constraint(equalTo: imageBreed.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
        ]
        
        let constraintsCountryDesLabel = [
            countryDesLabel.topAnchor.constraint(equalTo: imageBreed.bottomAnchor, constant: 10),
            countryDesLabel.leadingAnchor.constraint(equalTo: countryLabel.trailingAnchor, constant: 5),
            countryDesLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            countryDesLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraintsBreedNameLabel)
        NSLayoutConstraint.activate(constraintsBreedNameDesLabel)
        NSLayoutConstraint.activate(constraintsArrowIcon)
        NSLayoutConstraint.activate(constraintsCountryLabel)
        NSLayoutConstraint.activate(constraintsCountryDesLabel)
    }
    
    private let breedNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let breedNameDesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let countryDesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var imageBreed: UIImageView = {
        let image = UIImage(named: "1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setDataCell (breed: Breed) {
        self.breedNameLabel.text = breed.name
        self.breedNameDesLabel.text = breed.description
        self.countryLabel.text = "Pais de origen"
        self.countryDesLabel.text = breed.origin
        configure(breed.image?.url ?? "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg", imageBreed: imageBreed)
    }
    
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
