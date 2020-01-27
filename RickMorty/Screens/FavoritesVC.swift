//
//  FavoritesVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    
    var favorites: [Character] = []
    var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureTableView()
        getFavorites()
    }
    

    func configureViewController() {
        title = "Favorites"
        view.backgroundColor = .systemBackground
    }
    
    
    func configureTableView() {
        tableView               = UITableView(frame: view.bounds)
        tableView.delegate      = self
        tableView.rowHeight     = 80
        tableView.dataSource    = self
        
        view.addSubview(tableView)
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.reuseID)
    }
    
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
    
    func getFavorites() {
        showLoadingView()
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let favorites):
                self.favorites = favorites
                
                if favorites.isEmpty {
                    self.presentEmptyState(with: "Start adding characters to your favorite list", in: self.view)
                } else {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }

}


extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        let favorite    = favorites[indexPath.row]
        
        cell.set(character: favorite)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite        = favorites[indexPath.row]
        let destVC          = CharacterDetailsVC()
        destVC.characterID  = favorite.id
        
        let navigationController = UINavigationController(rootViewController: destVC)
        
        present(navigationController, animated: true)
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index       = indexPath.row
            let favorite    = favorites[index]
            
            PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
                guard let self = self else { return }
                
                if let error = error {
                    self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
                }
                
                let alert = UIAlertController(title: "Delete favorite", message: "Do you want to remove \(favorite.name) from your favorite list?", preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (alert) in
                    return
                }))
                
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] (alert) in
                    guard let self = self else { return }
                    
                    self.favorites.remove(at: index)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                }))
                
                self.present(alert, animated: true)
            }
        }
    }
    
}
