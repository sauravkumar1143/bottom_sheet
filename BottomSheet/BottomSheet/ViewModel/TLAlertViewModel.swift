import UIKit

enum TLAlertType {
    case controller(childController: UIViewController, footerButton: [TLFooterButton]?, header: TLHeaderData?)
    case customView(view: UIView, footerButton: [TLFooterButton]?, header: TLHeaderData?)
    case commonPopUp(data: TLAlertModel, footerButton: [TLFooterButton]?, header: TLHeaderData?)
}

@objc protocol TLAlertViewControllerDelegate: AnyObject {
    @objc func dismissAlertView(_ controller: TLAlertViewControllerNew)
    @objc func tappedOnFooterButton(_ footerView: TLFooterView?, sender: UIButton)
}

class TLAlertViewModel {
    
    // MARK: Variables
    var alertType: TLAlertType?
    var commonPopUpHeight: CGFloat?
    var topMargin: CGFloat?
    var percentageHeight: Double = 0.0
    
    /// get AlertView height based on Alert Type
    var getContentViewHeightForCommonPopUp: CGFloat {
        var height: CGFloat = 0.0
        if let frameHeight = commonPopUpHeight { // we can also give custom height
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
                        height += header!.headerHeight
                    }
                    if data.headerImage != nil {
                        height += 100 // 100 is height of image including top padding
                    }
                    let screenHeight = UIScreen.main.bounds.height - 150
                    let totalWidth = UIScreen.main.bounds.width - 78 // 78 is padding
                    let titleHeight = data.title?.height(withConstrainedWidth: totalWidth, font: data.titleFont!) ?? 0.0
                    let subTotalHeight = data.subtitle?.height(withConstrainedWidth: totalWidth, font: data.subTitleFont!) ?? 0.0
                    height += (titleHeight + subTotalHeight) + 40 // 30 is top padding for title and 10 is bottom Padding for subtitle
                    if height > screenHeight {
                        height = screenHeight
                    }
                default: break
                }
            }
        }
        return height
    }
    
    var contentHeight: CGFloat {
        if let type = alertType {
            switch type {
            case .controller(let childController, _, _):
                let childView = childController.view
                return calculateHeight(subView: childView!)
            case .customView(let view, _, _):
                return calculateHeight(subView: view)
            default: break
            }
        }
        return 0.0
    }
    
    func setHeight(percentage: CGFloat) {
        if percentage <= 1.0 && percentage > 0 {
            self.percentageHeight = percentage
        }
    }
    
    // For View
    var topSpace: CGFloat {
        return topMargin ?? 120
    }
    
    private func calculateHeight(subView: UIView) -> CGFloat {
        var h: CGFloat = 0
        if (percentageHeight > 0 ) {
            let screenHeight = UIScreen.main.bounds.height
            h = (screenHeight * percentageHeight)
        } else {
            //TODO: need to calculate intrinsic Height
            h = subView.calculatePreferredHeight(preferredWidth: UIScreen.main.bounds.width)
        }
        return h
    }
    
    // MARK: Initializer
    init(alertType: TLAlertType) {
        self.alertType = alertType
    }
}


extension UIView {
    func calculatePreferredHeight(preferredWidth: CGFloat) -> CGFloat {
            let widthConstraint = NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: preferredWidth
            )
            addConstraint(widthConstraint)
            let height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            removeConstraint(widthConstraint)
            return height
    }
}
