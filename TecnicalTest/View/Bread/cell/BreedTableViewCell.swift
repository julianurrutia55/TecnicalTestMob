//
//  BreedTableViewCell.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 27/02/21.
//

import UIKit

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
        contentView.addSubview(arrowIcon)
       
        let constraintsBreedNameLabel = [
            breedNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            breedNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
        ]
        
        let constraintsBreedNameDesLabel = [
            breedNameDesLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            breedNameDesLabel.leadingAnchor.constraint(equalTo: breedNameLabel.trailingAnchor, constant: 10),
            breedNameDesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ]
        
        let constraintsArrowIcon = [
            arrowIcon.topAnchor.constraint(equalTo: breedNameDesLabel.bottomAnchor, constant: 10),
            arrowIcon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            arrowIcon.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            arrowIcon.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let constraintsCountryLabel = [
            countryLabel.topAnchor.constraint(equalTo: arrowIcon.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
        ]
        
        let constraintsCountryDesLabel = [
            countryDesLabel.topAnchor.constraint(equalTo: arrowIcon.bottomAnchor, constant: 10),
            countryDesLabel.leadingAnchor.constraint(equalTo: countryLabel.trailingAnchor, constant: 10),
            countryDesLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 20),
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
        return label
    }()
    
    private let breedNameDesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryDesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var arrowIcon: UIImageView = {
        let image = UIImage(named: "1")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setDataCell () {
        self.breedNameLabel.text = "2222"
        self.breedNameDesLabel.text = "descoo"
        self.countryLabel.text = "pais"
        self.countryDesLabel.text = "Colombia"
        let image = UIImage(named: "1")
        self.arrowIcon = UIImageView(image: image)
    }
}
