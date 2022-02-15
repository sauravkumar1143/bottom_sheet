//
//  ViewController.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 18/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var numberOfButton: Int = 0

    lazy var addChildVCWithOutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Controller Without Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(viewControllerAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var addChildVCWithOneButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Controller With one Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(viewControllerAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addChildVCWithTwoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Controller With two Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.tag = 2
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(viewControllerAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addChildVCWithThreeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Controller With three Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(viewControllerAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var addCustomViewWithoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Custom View Without Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(customViewAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addCustomViewWithTwoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Custom View With two Buttons", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(customViewAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var commonPopUpWithouButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Common PopUp Withou Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(commonViewAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var commonPopUpWithTwoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Common PopUp Withou Button", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(commonViewAlertType(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        
        self.view.addSubview(addChildVCWithOutButton)
        self.view.addSubview(addChildVCWithOneButton)
        self.view.addSubview(addChildVCWithTwoButton)
        self.view.addSubview(addChildVCWithThreeButton)
        self.view.addSubview(addCustomViewWithoutButton)
        self.view.addSubview(addCustomViewWithTwoButton)
        self.view.addSubview(commonPopUpWithouButton)
        self.view.addSubview(commonPopUpWithTwoButton)
        
        addChildVCWithOutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        addChildVCWithOutButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        addChildVCWithOutButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        addChildVCWithOutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
        addChildVCWithOneButton.leadingAnchor.constraint(equalTo: addChildVCWithOutButton.leadingAnchor).isActive = true
        addChildVCWithOneButton.trailingAnchor.constraint(equalTo: addChildVCWithOutButton.trailingAnchor).isActive = true
        addChildVCWithOneButton.heightAnchor.constraint(equalTo: addChildVCWithOutButton.heightAnchor).isActive = true
        addChildVCWithOneButton.topAnchor.constraint(equalTo: self.addChildVCWithOutButton.bottomAnchor, constant: 30).isActive = true
        
        addChildVCWithTwoButton.leadingAnchor.constraint(equalTo: addChildVCWithOneButton.leadingAnchor).isActive = true
        addChildVCWithTwoButton.trailingAnchor.constraint(equalTo: addChildVCWithOneButton.trailingAnchor).isActive = true
        addChildVCWithTwoButton.heightAnchor.constraint(equalTo: addChildVCWithOneButton.heightAnchor).isActive = true
        addChildVCWithTwoButton.topAnchor.constraint(equalTo: self.addChildVCWithOneButton.bottomAnchor, constant: 30).isActive = true
        
        addChildVCWithThreeButton.leadingAnchor.constraint(equalTo: addChildVCWithTwoButton.leadingAnchor).isActive = true
        addChildVCWithThreeButton.trailingAnchor.constraint(equalTo: addChildVCWithTwoButton.trailingAnchor).isActive = true
        addChildVCWithThreeButton.heightAnchor.constraint(equalTo: addChildVCWithTwoButton.heightAnchor).isActive = true
        addChildVCWithThreeButton.topAnchor.constraint(equalTo: self.addChildVCWithTwoButton.bottomAnchor, constant: 30).isActive = true
        
        addCustomViewWithoutButton.leadingAnchor.constraint(equalTo: addChildVCWithThreeButton.leadingAnchor).isActive = true
        addCustomViewWithoutButton.trailingAnchor.constraint(equalTo: addChildVCWithThreeButton.trailingAnchor).isActive = true
        addCustomViewWithoutButton.heightAnchor.constraint(equalTo: addChildVCWithThreeButton.heightAnchor).isActive = true
        addCustomViewWithoutButton.topAnchor.constraint(equalTo: self.addChildVCWithThreeButton.bottomAnchor, constant: 30).isActive = true
        
        addCustomViewWithTwoButton.leadingAnchor.constraint(equalTo: addCustomViewWithoutButton.leadingAnchor).isActive = true
        addCustomViewWithTwoButton.trailingAnchor.constraint(equalTo: addCustomViewWithoutButton.trailingAnchor).isActive = true
        addCustomViewWithTwoButton.heightAnchor.constraint(equalTo: addCustomViewWithoutButton.heightAnchor).isActive = true
        addCustomViewWithTwoButton.topAnchor.constraint(equalTo: self.addCustomViewWithoutButton.bottomAnchor, constant: 30).isActive = true
        
        commonPopUpWithouButton.leadingAnchor.constraint(equalTo: addCustomViewWithTwoButton.leadingAnchor).isActive = true
        commonPopUpWithouButton.trailingAnchor.constraint(equalTo: addCustomViewWithTwoButton.trailingAnchor).isActive = true
        commonPopUpWithouButton.heightAnchor.constraint(equalTo: addCustomViewWithTwoButton.heightAnchor).isActive = true
        commonPopUpWithouButton.topAnchor.constraint(equalTo: self.addCustomViewWithTwoButton.bottomAnchor, constant: 30).isActive = true
        
        commonPopUpWithTwoButton.leadingAnchor.constraint(equalTo: commonPopUpWithouButton.leadingAnchor).isActive = true
        commonPopUpWithTwoButton.trailingAnchor.constraint(equalTo: commonPopUpWithouButton.trailingAnchor).isActive = true
        commonPopUpWithTwoButton.heightAnchor.constraint(equalTo: commonPopUpWithouButton.heightAnchor).isActive = true
        commonPopUpWithTwoButton.topAnchor.constraint(equalTo: self.commonPopUpWithouButton.bottomAnchor, constant: 30).isActive = true
    }

}

// MARK: ViewController
extension ViewController {
    @objc fileprivate func viewControllerAlertType(_ sender: UIButton) {
        let chVC = ChildViewController()
        numberOfButton = sender.tag
        let btns = getButtonsArray(count: numberOfButton)
        let bottomSheetVC = TLAlertViewControllerNew()
        bottomSheetVC.delegate = self
        
        let alertType = TLAlertType.controller(childController: chVC, footerButton: btns, header: nil)
        bottomSheetVC.viewModel = TLAlertViewModel(alertType: alertType)
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
}

// MARK: Custom View
extension ViewController {
    @objc fileprivate func customViewAlertType(_ sender: UIButton) {
        let customView = CustomView()
        let bottomSheetVC = TLAlertViewControllerNew()
        bottomSheetVC.delegate = self
        numberOfButton = sender.tag
        let btns = getButtonsArray(count: numberOfButton)
        let alertType = TLAlertType.customView(view: customView, footerButton: btns, header: nil)
        bottomSheetVC.viewModel = TLAlertViewModel(alertType: alertType)
       // bottomSheetVC.viewModel?.percentageHeight = 0.5
        //bottomSheetVC.viewModel?.topMargin = 100
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
}

// MARK: Common View
extension ViewController {
    @objc fileprivate func commonViewAlertType(_ sender: UIButton) {
        var alertModel = TLAlertModel()
        alertModel.title = " title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title"
        alertModel.subtitle = " subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button subtitle subtitle subtitle subtitle subtitle Controller With three Button"
        numberOfButton = sender.tag
        let btns = getButtonsArray(count: numberOfButton)
        let bottomSheetVC = TLAlertViewControllerNew()
        bottomSheetVC.delegate = self
        var header = TLHeaderData()
        header.btnImage = UIImage(named: "Close")
        header.headerTitle = "You Can Set Header Title Here"
        let alertType = TLAlertType.commonPopUp(data: alertModel, footerButton: btns, header: header)
        bottomSheetVC.viewModel = TLAlertViewModel(alertType: alertType)
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
}

extension ViewController {
    private func getButtonsArray(count: Int) -> [TLFooterButton] {
        var butonsArr: [TLFooterButton] = []
        if count > 0 {
            var first = TLFooterButton()
            first.title = "First"
            first.cornerRadius = 5
            first.backGroundColor = .blue
            first.textColor = .white
            
            var second = TLFooterButton()
            second.title = "Second"
            second.cornerRadius = 5
            second.backGroundColor = .green
            
            var third = TLFooterButton()
            third.title = "Third"
            third.cornerRadius = 5
            third.backGroundColor = .red
            
            butonsArr = [first]
            if count == 2 {
                butonsArr = [first, second]
            } else if count == 3 {
                butonsArr = [first, second, third]
            }
        }

        return butonsArr
    }
}

extension ViewController: TLAlertViewControllerDelegate {
    func dismissAlertView(_ controller: TLAlertViewControllerNew) {
        print("Dismiss")
    }
    
    func tappedOnFooterButton(_ footerView: TLFooterView?, sender: UIButton) {
        print("button number:-  \(sender.tag)")
    }
}
