//
//  SettingViewController.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var username: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        if let name = username{
            print("User Name is: \(name)")
        }else{
             print("User Name is not found...")
        }
    }
   
    @objc func handleDismiss()
    {
        dismiss(animated: true, completion: nil)
    }
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        //let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 25)!]
        //UINavigationBar.appearance().titleTextAttributes = attributes

navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_arrow_back_ios_white_24pt_1x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
    }

}
