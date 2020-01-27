//
//  LocationsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class LocationsVC: UIViewController {
    
    var locations: [Location] = []
    var filteredLocations: [Location] = []
    var tableView: UITableView!
    var page: Int = 1
    var hasMoreData: Bool = false
    var isSearching: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureSearchController()
        getLocations(page: page)
        configureTableView()
    }
    

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView() {
        tableView               = UITableView(frame: view.bounds)
        tableView.delegate      = self
        tableView.dataSource    = self
        
        view.addSubview(tableView)
    }
    
    
    func getLocations(page: Int) {
        showLoadingView()
        
        NetworkManager.shared.getLocations(page: page, locationsID: nil) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let locations):
                if !locations.info.next.isEmpty { self.hasMoreData = true }
                self.filteredLocations.append(contentsOf: locations.results)
                self.locations = self.filteredLocations
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
                
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    func configureSearchController() {
        let searchController = UISearchController()
        
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.delegate                     = self
        searchController.searchBar.placeholder                  = "Search locations"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.hidesSearchBarWhenScrolling              = false
        navigationItem.searchController                         = searchController
    }

}


extension LocationsVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter    = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching         = true
        filteredLocations   = locations.filter { $0.name.lowercased().contains(filter.lowercased()) }
        
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching         = false
        filteredLocations   = locations
        
        tableView.reloadData()
    }
    
}


extension LocationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        = UITableViewCell(style: .subtitle, reuseIdentifier: "LocationCell")
        let location    = filteredLocations[indexPath.row]
        
        cell.textLabel?.text        = location.name
        cell.detailTextLabel?.text  = location.type
        cell.accessoryType          = .disclosureIndicator
        
        return cell
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height && !isSearching {
            guard hasMoreData else { return }
            page += 1
            getLocations(page: page)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC      = LocationDetailsVC()
        let location    = filteredLocations[indexPath.row]
        
        destVC.locationID = location.id
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
