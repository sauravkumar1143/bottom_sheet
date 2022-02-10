//
//  TLAlertModel.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import Foundation
import UIKit
import SwiftUI

struct TLAlertModel {
    
    var headerImageBackgroundColor:UIColor?
    var headerImage: UIImage?
    var title: String?
    var subtitle: String?
    var titleColor: UIColor?
    var subTitleColor: UIColor?
    var titleFont: UIFont?
    var subTitleFont: UIFont?
    
    init() {
        // Default Color we are taking from theme, but we cane change the color of title and subtitle based on our requirement
//        if let color = theme.getMonotoneColor()?.darkGreyColor {
//            titleColor = color
//            subTitleColor = color
//        }
//        // Default Font Size from Theme , but we can change the font based on our requrement
        titleFont = UIFont.systemFont(ofSize: 16)
        subTitleFont = UIFont.systemFont(ofSize: 14)
       // headerImage = UIImage(named: "studyPlanLeftIcon") // Default Image
    }
}

struct TLFooterButton {
    var title: String?
    var textColor: UIColor?
    var font: UIFont?
    var cornerRadius: CGFloat?
    var backGroundColor: UIColor?
    var image:UIImage?
    
    init() {
        textColor = UIColor.black
    }
}

struct TLHeaderData {
    
    var headerTitle: String?
    var headerTitleColor:UIColor?
    var headerTitleFont:UIFont?
    var headerTitleAlignment: NSTextAlignment = .center
    
    var btnTitle: String?
    var btnImage: UIImage?
    var btnTitleFont: UIFont? = UIFont.systemFont(ofSize: 20, weight: .semibold)
    var btnBackGroundColor: UIColor?
    var btnCornerRadius:CGFloat?
    var btnTextColor:UIColor?
    var seperatorColor: UIColor?
    var headerHeight: CGFloat = 45// Default

    
    var buttonWidth: CGFloat {
        var finalWidth: CGFloat = 25.0
        if let title = btnTitle, title.count > 0 {
            let width = title.width(withConstrainedHeight: 25, font: btnTitleFont!)
            finalWidth = width + 10
        }
        return finalWidth
    }
    
}

