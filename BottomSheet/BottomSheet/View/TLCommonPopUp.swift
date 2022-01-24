//
//  TLCommonPopUp.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import UIKit

class TLCommonPopUpView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    lazy var headerImage: UIImageView = {
        let headerImg = UIImageView()
        headerImg.translatesAutoresizingMaskIntoConstraints = false
        headerImg.clipsToBounds = true
        headerImg.contentMode = .scaleAspectFit
        return headerImg
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .center
        return titleLbl
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.numberOfLines = 0
        subTitle.textAlignment = .center
        return subTitle
    }()
    
    var data: TLAlertModel? {
        didSet {
           updateUI()
        }
    }
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Custom Method
    private func configureUI() {
                
        self.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        contentView.addSubview(headerImage)
        headerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 72).isActive = true
        headerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        headerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.headerImage.bottomAnchor, constant: 30).isActive = true
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        subTitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
}

extension TLCommonPopUpView {
    
    private func updateUI() {
        guard let data = data else { return }
        titleLabel.textColor = data.titleColor
        subTitleLabel.textColor = data.subTitleColor
        titleLabel.text = data.title
        subTitleLabel.text = data.subtitle
        subTitleLabel.font = data.subTitleFont
        titleLabel.font = data.titleFont
        headerImage.image = UIImage(named: "happy")
    }

}
