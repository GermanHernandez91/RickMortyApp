//
//  CharactersVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

enum CharacterScreenType {
    case main, secondary
}

class CharactersVC: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var characters: [Character]         = []
    var filteredCharacters: [Character] = []
    var charactersID: [Int]             = []
    var isSearching                     = false
    var page: Int                       = 1
    var hasMoreData: Bool               = false
    var screenType: CharacterScreenType = .main
    var pageTitle: String               = "Characters"
    
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureSearchController()
        getCharacters(page: page)
        configureTableView()
    }
    
    
    init(screenType: CharacterScreenType, title: String, charactersID: [Int]?) {
        super.init(nibName: nil, bundle: nil)
        
        self.screenType = screenType
        self.pageTitle = title
        
        if let charactersID = charactersID {
            self.charactersID = charactersID
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    
    func configureTableView() {
        tableView               = UITableView(frame: view.bounds)
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        
        view.addSubview(tableView)
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.reuseID)
    }
    

    func configureViewController() {
        title = pageTitle
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if screenType == .main {
            let rightButton = UIBarButtonItem(image: UIImage(systemName: SFSymbols.favorites), style: .plain, target: self, action: #selector(onRightButtonPressed))
                   navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    
    @objc func onRightButtonPressed() {
        let destVC = FavoritesVC()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
    func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.delegate                     = self
        searchController.searchBar.placeholder                  = "Search characters"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.hidesSearchBarWhenScrolling              = false
        navigationItem.searchController                         = searchController
    }
    
    
    func getCharacters(page: Int) {
        showLoadingView()
        
        NetworkManager.shared.getCharacters(page: page, charactersID: charactersID) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let characters):
                if !characters.info.next.isEmpty { self.hasMoreData = true }
                self.filteredCharacters.append(contentsOf: characters.results)
                self.characters = self.filteredCharacters
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }

}


extension CharactersVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter    = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching         = true
        filteredCharacters  = characters.filter { $0.name.lowercased().contains(filter.lowercased()) }
        
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching         = false
        filteredCharacters  = characters
        
        tableView.reloadData()
    }
    
}


extension CharactersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCharacters.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        let character   = filteredCharacters[indexPath.row]
        
        cell.set(character: character)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character           = filteredCharacters[indexPath.row]
        let destVC              = CharacterDetailsVC()
        destVC.characterID      = character.id
        
        let navigationController = UINavigationController(rootViewController: destVC)
        
        present(navigationController, animated: true)
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height && !isSearching {
            guard hasMoreData else { return }
            page += 1
            getCharacters(page: page)
        }
    }
    
}
