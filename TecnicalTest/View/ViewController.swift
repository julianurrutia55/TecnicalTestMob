//
//  ViewController.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import UIKit
import Swinject
class ViewController: UIViewController {

    private var breedViewModel: BreedViewModel

    init(breedViewModel: BreedViewModel) {
        self.breedViewModel = breedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        breedViewModel.getDataListBreed()
    }


}

