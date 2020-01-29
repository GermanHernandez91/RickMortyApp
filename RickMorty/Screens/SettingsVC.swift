//
//  SettingsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    var tableView: UITableView!
    var privacyCell = UITableViewCell()
    var terms       = UITableViewCell()
    var version     = UITableViewCell()
    let appVersion  = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureCells()
        configureTableView()
    }
    

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCells() {
        privacyCell.accessoryType   = .disclosureIndicator
        privacyCell.textLabel!.text = "Privacy policy"
        
        terms.accessoryType     = .disclosureIndicator
        terms.textLabel!.text   = "Terms and conditions"
        
        version.textLabel!.text = "Version \(appVersion ?? "1.0.0")"
    }
    
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.sectionHeaderHeight = 40
    }

}


extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 2
        case 1: return 1
        default: fatalError("Unknown number of sections")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: return self.privacyCell
            case 1: return self.terms
            default: fatalError("Unknown row in section 0")
        }
        case 1:
            switch(indexPath.row) {
            case 0: return self.version
            default: fatalError("Unknown row in section 1")
        }
        default: fatalError("Unknown section")
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .systemGray5
        
        switch section {
        case 0:
            return UIView(frame: .zero)
        case 1:
            return headerView
        default:
            fatalError("Unknown section")
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                showSafariURL(for: "https://www.google.co.uk")
            case 1:
                showSafariURL(for: "https://www.gearedapp.co.uk")
            default:
                fatalError("Unknown cell")
            }
        case 1:
            break
        default:
            fatalError("Unknown section")
        }
    }
    
    
    func showSafariURL(for url: String) {
        guard let url = URL(string: url) else {
            self.presentRMAlert(title: "Something went wrong", message: "URL is invalid", buttonTitle: "Dismiss")
            return
        }
        
        presentSafariVC(with: url)
    }
    
}
