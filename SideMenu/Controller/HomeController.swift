//
//  HomeController.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    //MARK :- Properties
    var delegate: HomeControllerDelegate?
    
    
    //MARK :- Init
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        configureNavigationBar()
    }
    

    //MARK :- Handlers
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_menu_white_24pt_1x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle(forMenuOption: nil)
       
    }
}
