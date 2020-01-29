//
//  SceneDelegate+Ext.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

extension SceneDelegate {
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        configurationTabBar()
        tabBar.viewControllers = [createCharactersNC(), createLocationsNC(), createEpisodesNC(), createSettingsNC()]
        
        return tabBar
    }
    
    
    func configurationBar() {
        UINavigationBar.appearance().tintColor = .systemRed
    }
    
    
    func configurationTabBar() {
        UITabBar.appearance().tintColor = .systemRed
    }
    
    
    func createCharactersNC() -> UINavigationController {
        let charactersVC        = CharactersVC(screenType: .main, title: "Characters", charactersID: nil)
        charactersVC.title      = "Characters"
        charactersVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: SFSymbols.characters), tag: 0)
        
        return UINavigationController(rootViewController: charactersVC)
    }
    
    
    func createLocationsNC() -> UINavigationController {
        let locationsVC         = LocationsVC()
        locationsVC.title       = "Locations"
        locationsVC.tabBarItem  = UITabBarItem(title: "Locations", image: UIImage(systemName: SFSymbols.locations), tag: 1)
        
        return UINavigationController(rootViewController: locationsVC)
    }
    
    
    func createEpisodesNC() -> UINavigationController {
        let episodesVC = EpisodesVC()
        episodesVC.title = "Episodes"
        episodesVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: SFSymbols.episodes), tag: 2)
        
        return UINavigationController(rootViewController: episodesVC)
    }
    
    
    func createSettingsNC() -> UINavigationController {
        let settingsVC = SettingsVC()
        settingsVC.title = "Settings"
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: SFSymbols.settings), tag: 3)
        
        return UINavigationController(rootViewController: settingsVC)
    }
    
}
