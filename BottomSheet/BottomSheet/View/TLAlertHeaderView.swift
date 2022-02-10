//
//  TLAlertHeaderView.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 20/01/22.
//

import UIKit


@objc protocol TLAlertHeaderViewDelegate: AnyObject {
   @objc optional func dismissPopUp(_ view: TLAlertHeaderView?)
}

class TLAlertHeaderView: UIView {
    
    var headerTitleLabel: UILabel = {
        let headerLbl = UILabel()
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        headerLbl.numberOfLines = 1
        headerLbl.text = ""
        return headerLbl
    }()
    
    var closeButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(tappedOnCloseButton(_:)), for: .touchUpInside)
        return btn
    }()
    
    var bottomSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var data: TLHeaderData? {
        didSet {
           updateUI()
        }
    }
    
    weak var delegate: TLAlertHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TLAlertHeaderView {
    
    @objc private func tappedOnCloseButton(_ sender: UIButton) {
        delegate?.dismissPopUp?(self)
    }
    
    private func configureUI() {
        
        self.addSubview(headerTitleLabel)
        headerTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        headerTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        self.addSubview(closeButton)
        closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        closeButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        closeButton.leadingAnchor.constraint(greaterThanOrEqualTo: headerTitleLabel.trailingAnchor, constant: 16).isActive = true
        headerTitleLabel.centerYAnchor.constraint(equalTo: self.closeButton.centerYAnchor).isActive = true
        
        self.addSubview(bottomSeperatorView)
        bottomSeperatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomSeperatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomSeperatorView.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor).isActive = true
        bottomSeperatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    private func updateUI() {
        guard let data = self.data else { return }
        closeButton.widthAnchor.constraint(equalToConstant: data.buttonWidth).isActive = true
        
        // For Close Button
        if let cornerRadius = data.btnCornerRadius {
            closeButton.layer.cornerRadius = cornerRadius
        }
        
        if let title = data.btnTitle {
            closeButton.setTitle(title, for: .normal)
        }
        
        if let backColor = data.btnBackGroundColor {
            closeButton.backgroundColor = backColor
        }
        
        if let textColor = data.btnTextColor {
            closeButton.setTitleColor(textColor, for: .normal)
        }
        
        if let btnFont = data.btnTitleFont {
            closeButton.titleLabel?.font = btnFont
        }
        
        if let btnImage = data.btnImage {
            closeButton.setImage(btnImage, for: .normal)
        }
        
        // For Header Title
        if let headerText = data.headerTitle {
            headerTitleLabel.text = headerText
        }
        
        if let headerFont = data.headerTitleFont {
            headerTitleLabel.font = headerFont
        }
        
        if let headerTitleColor = data.headerTitleColor {
            headerTitleLabel.textColor = headerTitleColor
        }
        
        // Default is center
        headerTitleLabel.textAlignment = data.headerTitleAlignment
        
        if let color = data.seperatorColor {
            bottomSeperatorView.backgroundColor = color
        }
    }
    
}

