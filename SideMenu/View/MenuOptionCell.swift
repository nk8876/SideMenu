//
//  MenuOptionCell.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    //MARK:- Properties
    
    let iconImageView: UIImageView = {
       
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sample Text"
        return label
        
    }()
    //MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .darkGray
        selectionStyle = .none
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant:  16).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelName.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant:  12).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Handlers

}
