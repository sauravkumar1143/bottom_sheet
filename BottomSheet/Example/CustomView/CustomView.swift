//
//  CustomView.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import UIKit

class CustomView: UIView {
    
    lazy var titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "I am custom View and i am added into bottom sheet I am custom View "
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "happy")
        return image
    }()
    
    lazy var view: UIView = {
        let image = UIView()
         image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
         return image
        
    }()
    lazy var titleLabel1: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "I am custom View and i am added into bottom sheet I am custom View I am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom ViewI am custom View and i am added into bottom sheet I am custom View "
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        
        self.addSubview(image)
        self.addSubview(titleLabel)
        self.addSubview(view)
        view.addSubview(titleLabel1)
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true

        view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        titleLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        titleLabel1.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true

        



    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
