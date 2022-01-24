//
//  TLFooterButtonView.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import UIKit

protocol TLFooterViewDeleagte: AnyObject {
    func clickedOnButton(_ footerView: TLFooterView?, sender: UIButton)
}
class TLFooterView: UIView {
    
    // MARK: Variables
    lazy var horizantolStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    weak var delegate: TLFooterViewDeleagte?
    
    var buttonsArr: [TLFooterButton]? {
        didSet {
            configureUI()
        }
    }
    
    // MARK: App Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TLFooterView {
    private func configureUI() {
        self.addSubview(horizantolStack)
        
        horizantolStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizantolStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        horizantolStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizantolStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        if let btnsArr = buttonsArr {
            for (i, btnData) in btnsArr.enumerated() {
                let btn = UIButton(type: .custom)
                btn.setTitle(btnData.title, for: .normal)
                btn.setTitleColor(btnData.textColor, for: .normal)
                btn.backgroundColor = btnData.backGroundColor
                btn.layer.cornerRadius = btnData.cornerRadius
                btn.clipsToBounds = true
                btn.tag = i+1
                btn.addTarget(self, action: #selector(clickedOnButton(_:)), for: .touchUpInside)
                horizantolStack.addArrangedSubview(btn)
            }
        }
    }
    
    @objc func clickedOnButton(_ sender: UIButton) {
        delegate?.clickedOnButton(self, sender: sender)
    }
}
