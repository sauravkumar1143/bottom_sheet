//
//  TLAlertModel.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import Foundation
import UIKit

struct TLAlertModel {
    var headerImage: UIImage?
    var title: String?
    var subtitle: String?
    var titleColor: UIColor = .black
    var subTitleColor: UIColor = .darkGray
    var titleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
    var subTitleFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
}

struct TLFooterButton {
    var title: String?
    var textColor: UIColor = .black
    var font: UIFont?
    var cornerRadius: CGFloat = 0.0
    var backGroundColor: UIColor?
    var image:UIImage?
    var tag: Int? // Optional(You can assign a tag )
}

struct TLHeaderData {
    var headerTitle: String?
    var headerTitleColor:UIColor?
    var headerTitlFont:UIFont?
    
    var btnTitle: String?
    var btnImage: UIImage?
    var btnTitleFont: UIFont? = UIFont.systemFont(ofSize: 20, weight: .semibold)
    var btnBackGroundColor: UIColor?
    var btnCornerRadius:CGFloat?
    var btnTextColor:UIColor?
    
    var buttonWidth: CGFloat {
        var finalWidth: CGFloat = 25.0
        if let title = btnTitle, title.count > 0 {
            let width = title.width(withConstrainedHeight: 25, font: btnTitleFont!)
            finalWidth = width + 10
        }
        return finalWidth
    }
}
