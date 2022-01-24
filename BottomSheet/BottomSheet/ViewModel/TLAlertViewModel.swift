//
//  TLAlertViewModel.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 18/01/22.
//

import UIKit

enum TLAlertType {
    case controller(childController: UIViewController, footerButton: [TLFooterButton]?, header: TLHeaderData?)
    case customView(view: UIView, footerButton: [TLFooterButton]?, header: TLHeaderData?)
    case commonPopUp(data: TLAlertModel, footerButton: [TLFooterButton]?, header: TLHeaderData?)
}

@objc protocol TLAlertViewControllerDelegate: AnyObject {
    @objc func dismissAlertView(_ controller: TLAlertViewController)
    @objc func tappedOnFooterButton(_ footerView: TLFooterView?, sender: UIButton)
}

class TLAlertViewModel {
    
    // MARK: Variables
    var alertType: TLAlertType?
    var popUpHeight: CGFloat?
    var topSpace: CGFloat?
    
    /// get AlertView height based on Alert Type
    var getContentViewHeight: CGFloat {
        var height: CGFloat = 0.0
        if let frameHeight = popUpHeight { // we can also give custom height
            height = frameHeight
        } else {
            
            // dynamic Height Based on content
            
            if let type = alertType {
                switch type {
                case .commonPopUp(let data, let footerButton, let header):
                    
                    if let arrOfBtn = footerButton, arrOfBtn.count > 0 {  // if footer view exist
                        height += 60
                    }
                    if header != nil { // if header exist height of header
                        height += 84
                    } else {
                        height += 40
                    }
                    let screenHeight = UIScreen.main.bounds.height - 150
                    let totalWidth = UIScreen.main.bounds.width - 78 // 78 is padding
                    let titleHeight = data.title?.height(withConstrainedWidth: totalWidth, font: data.titleFont) ?? 0.0
                    let subTotalHeight = data.subtitle?.height(withConstrainedWidth: totalWidth, font: data.subTitleFont) ?? 0.0
                    height += (titleHeight + subTotalHeight + 102) // 102 is height of image with top and bottm padding
                    if height > screenHeight {
                        height = screenHeight
                    }
                default: break
                }
            }
        }
        return height
    }
    
    // For View 
    var getTopSpace: CGFloat {
        var topSpace = 0.0
        if let space = self.topSpace {
            topSpace = space
        } else {
            if let type = alertType {
                switch type {
                case .controller(_ , _, _):
                    topSpace = 120
                case .customView(_ , _, _):
                    topSpace = 300
                default: break
                }
            }
        }
        return topSpace
    }
    
    // MARK: Initializer
    init(alertType: TLAlertType) {
        self.alertType = alertType
    }
        
}
