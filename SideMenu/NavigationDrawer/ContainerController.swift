//
//  ContainerController.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    //MARK:- Properties
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpand = false
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpand
    }
     //MARK:- Handelr
    func configureHomeController()  {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
    func configureMenuController()  {
        if menuController == nil{
            //add our menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
           
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand{
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 100
            }, completion: nil)
        }else{
            //hide menu
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//                self.centerController.view.frame.origin.x = 0
//            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption:MenuOption)  {
        switch menuOption {
        case .Profile:
            print("Show Profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Notifications")
        case .Settings:
        let controller = SettingViewController()
        controller.username = "Naresh"
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
           self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}
extension ContainerController: HomeControllerDelegate{
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpand{
            configureMenuController()
        }
        isExpand = !isExpand
        animatePanel(shouldExpand: isExpand, menuOption: menuOption)
    }
   
}
