//
//  MenuController.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit
private let reuseIdentifies = "MenuOptionCell"
class MenuController: UIViewController {
    
    //MARK:- Properties
    
    var tableView: UITableView!
    var profileView: UIView!
    var delegate: HomeControllerDelegate?
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
      //MARK:- hadlers
    func configureTableView()  {
        
//        profileView = UIView()
//        profileView.backgroundColor = UIColor.darkGray
//        view.addSubview(profileView)
//        profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        profileView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        profileView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        profileView.heightAnchor.constraint(equalToConstant: 150)
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifies)
        tableView.backgroundColor = UIColor.darkGray
        tableView.separatorStyle = .none
       
        tableView.rowHeight = 50
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

    }
}
extension MenuController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifies, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.labelName.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}

