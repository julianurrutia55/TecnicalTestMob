//
//  ViewController.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import UIKit
class BreedViewController: UIViewController{

    //views
    private var tableView : UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    private var breedViewModel: BreedViewModel
    private let searchPlaceHolder = "Buscar"
    private let titleNavigator = "CatBreeds"
    private let idUserCell = "userCell"
    private let emptyListMessage = "La lista esta vacia"
    let cellSpacingHeight: CGFloat = 1


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
        breedViewModel.delegate = self
        configureNavigatorBar()
        configureSearchBar()
        setUpViews()
        setConstraints()
        showLoading()
        breedViewModel.getDataListBreed()
    }

    private func setUpViews() {
        view.backgroundColor = UIColor.white
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BreedTableViewCell.self, forCellReuseIdentifier: idUserCell)
        tableView.accessibilityIdentifier = "userTableView"
        tableView.reloadData()
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
                
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    private func configureNavigatorBar() {
        self.navigationItem.title = titleNavigator
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = searchPlaceHolder
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        breedViewModel.breedFiltered = breedViewModel.breeds.filter { (breed: Breed) -> Bool in
            return breed.name!.lowercased().contains(searchText.lowercased())
          }
        tableView.reloadData()
    }
}

//MARK: - ViewModel Delegate

extension BreedViewController: BreedsViewModelDelegate {
    func error() {
        DispatchQueue.main.async {
            self.hideLoading()
            self.alert()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.hideLoading()
        }
    }
}

// MARK: - Extension de UITableViewDataSource
extension BreedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = !isFiltering ? breedViewModel.breeds.count : breedViewModel.breedFiltered.count
        if count == 0 && isFiltering {
            tableView.setEmptyMessage(emptyListMessage)
        } else {
            tableView.restore()
        }
        
        return count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idUserCell, for: indexPath) as? BreedTableViewCell
       
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 1
        cell?.layer.cornerRadius = 9
        
        let breed = !isFiltering ? breedViewModel.breeds[indexPath.row] : breedViewModel.breedFiltered[indexPath.row]
        cell?.setDataCell(breed: breed)
        return cell!
    }
}

// MARK: - Extension de UITableViewDelegate
extension BreedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = !isFiltering ? breedViewModel.breeds[indexPath.row] : breedViewModel.breedFiltered[indexPath.row]
        let vc = BreedDetailViewController(breed: breed)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
}

// MARK: - Extension de SearchController
extension BreedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text {
            filterContentForSearchText(searchText)
        }
    }
}
