//
//  CharactersVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class CharactersVC: UIViewController {
    
    // MARK: - Properties
    
    var characters: [Character] = []
    var page: Int = 1
    
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureSearchController()
        getCharacters()
    }
    
    
    // MARK: - Methods
    

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: SFSymbols.favorites), style: .plain, target: self, action: #selector(onRightButtonPressed))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    
    @objc func onRightButtonPressed() {}
    
    
    func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.delegate                     = self
        searchController.searchBar.placeholder                  = "Search characters"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.hidesSearchBarWhenScrolling              = false
        navigationItem.searchController                         = searchController
    }
    
    
    func getCharacters() {
        #warning("Show loading view")
        
        NetworkManager.shared.getCharacters(page: page, charactersID: nil) { result in
            #warning("Dismiss loading view")
            
            switch result {
            case .success(let characters):
                print(characters)
            case .failure(let error):
                print(error)
                #warning("Show error alert")
            }
        }
    }

}

extension CharactersVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
