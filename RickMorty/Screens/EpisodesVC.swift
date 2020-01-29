//
//  EpisodesVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

enum EpisodeScreenType {
    case main, secondary
}

class EpisodesVC: UIViewController {
    
    var tableView: UITableView!
    var episodesID: [Int]               = []
    var episodes: [Episode]             = []
    var filteredEpisodes: [Episode]     = []
    var page: Int                       = 1
    var hasMoreData: Bool               = false
    var isSearching: Bool               = false
    var screenType: EpisodeScreenType   = .main
    var pageTitle: String               = "Episodes"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureSearchController()
        getEpisodes(page: page)
        configureTableView()
    }
    
    
    init(screenType: EpisodeScreenType, title: String, episodesID: [Int]?) {
        super.init(nibName: nil, bundle: nil)
        
        self.screenType = screenType
        self.pageTitle = title
        
        if let episodesID = episodesID {
            self.episodesID = episodesID
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
     func configureSearchController() {
           let searchController = UISearchController()
           
           searchController.searchResultsUpdater                   = self
           searchController.searchBar.delegate                     = self
           searchController.searchBar.placeholder                  = "Search episodes"
           searchController.obscuresBackgroundDuringPresentation   = false
           navigationItem.hidesSearchBarWhenScrolling              = false
           navigationItem.searchController                         = searchController
       }
    
    
    func configureTableView() {
           tableView               = UITableView(frame: view.bounds)
           tableView.delegate      = self
           tableView.dataSource    = self
           
           view.addSubview(tableView)
       }
       
       
       func getEpisodes(page: Int) {
           showLoadingView()
           
           NetworkManager.shared.getEpisodes(page: page, episodesID: episodesID) { [weak self] result in
               guard let self = self else { return }
               
               self.dismissLoadingView()
               
               switch result {
               case .success(let episodes):
                   if !episodes.info.next.isEmpty { self.hasMoreData = true }
                   self.filteredEpisodes.append(contentsOf: episodes.results)
                   self.episodes = self.filteredEpisodes
                   
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


extension EpisodesVC: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter    = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching         = true
        filteredEpisodes    = episodes.filter { $0.name.lowercased().contains(filter.lowercased()) }
        
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching         = false
        filteredEpisodes    = episodes
        
        tableView.reloadData()
    }
    
}


extension EpisodesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        = UITableViewCell(style: .subtitle, reuseIdentifier: "EpisodeCell")
        let episode     = filteredEpisodes[indexPath.row]
        
        cell.textLabel?.text        = episode.name
        cell.detailTextLabel?.text  = episode.airDate
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
            getEpisodes(page: page)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC      = EpisodeDetailsVC()
        let episode     = filteredEpisodes[indexPath.row]
        
        destVC.episodeID = episode.id
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
