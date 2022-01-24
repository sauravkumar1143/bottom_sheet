//
//  TLAlertViewController.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 18/01/22.
//

import UIKit

class TLAlertViewController: UIViewController {
    
    // MARK: Variables
    var viewModel: TLAlertViewModel?
    
    lazy var contentView: UIView = {
      let contentView = UIView()
      contentView.translatesAutoresizingMaskIntoConstraints = false
      contentView.backgroundColor = .white
      contentView.layer.cornerRadius = 6
      contentView.clipsToBounds = true
      return contentView
    }()
    
    lazy var dimViewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.addTarget(self, action: #selector(dismissAlertView(_:)), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: TLAlertViewControllerDelegate?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetUp()
    }
    
    private func intialSetUp() {
        self.view.backgroundColor = .clear
        configureDimView()
        configureContentView()
        configureUI()
    }
    
    private func configureUI() {
        if let type = viewModel?.alertType {
            switch type {
            case .controller(let childController, let footerButton, let header):
                configureChild(childViewController: childController, footerButton: footerButton, headerData: header)
            case .customView(let view, let footerButton, let header):
                configureCustomView(customView: view, footerButtons: footerButton, headerData: header)
            case .commonPopUp(let data, let footerButton, let header):
                configureCommonPopUp(data: data, footerButtons: footerButton, headerData: header)
            }
        }
    }
    
    private func configureContentView() {
        view.addSubview(contentView)
        contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 4).isActive = true
        if let type = viewModel?.alertType {
            switch type {
            case .controller(_, _, _):
                contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: (viewModel?.getTopSpace)!).isActive = true
            case .customView(_, _, _):
                contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: (viewModel?.getTopSpace)!).isActive = true
            case .commonPopUp(_, _, _):
                contentView.heightAnchor.constraint(equalToConstant: (viewModel?.getContentViewHeight)!).isActive = true
            }
        }
    }
    
    private func configureDimView() {
        view.addSubview(dimViewButton)
        dimViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        dimViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        dimViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        dimViewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc private func dismissAlertView(_ sender: UIButton) {
        delegate?.dismissAlertView(self)
        dismissVC()
    }
    
    private func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// This function will call add view based on data
    /// - Parameters:
    ///   - subView: middle view
    ///   - footerButtons: bottom button data
    ///   - headerData: header data
    private func addSubviewIntoContentView(subView: UIView, footerButtons: [TLFooterButton]?, headerData: TLHeaderData?) {
        
        var headerView:TLAlertHeaderView?
        if let header = headerData {
            headerView = TLAlertHeaderView()
            headerView?.data = header
            headerView?.delegate = self
            headerView?.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(headerView!)
            headerView?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            headerView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            headerView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            headerView?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        }
       
        contentView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        if let header = headerView { // If header view exist
            subView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        } else {
            subView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        }
        subView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        subView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        if let buttonsArr = footerButtons, buttonsArr.count > 0 {
            let footerView = TLFooterView()
            footerView.buttonsArr = footerButtons
            footerView.delegate = self
            footerView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(footerView)
            footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
            footerView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 10).isActive = true
            footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
            footerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        } else {
            subView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
        
    }
    
}

// MARK: For Controller Alert Type
extension TLAlertViewController {
    private func configureChild(childViewController: UIViewController, footerButton: [TLFooterButton]?, headerData: TLHeaderData?) {
        addChild(childViewController)
        addSubviewIntoContentView(subView: childViewController.view, footerButtons: footerButton, headerData: headerData)
        childViewController.didMove(toParent: self)
    }
    
}

// MARK: For CustomView
extension TLAlertViewController {
    func configureCustomView(customView: UIView, footerButtons: [TLFooterButton]?, headerData: TLHeaderData?) {
        self.addSubviewIntoContentView(subView: customView, footerButtons: footerButtons, headerData: headerData)
    }
}

// MARK: Common PopUp
extension TLAlertViewController {
    private func configureCommonPopUp(data: TLAlertModel, footerButtons: [TLFooterButton]?, headerData: TLHeaderData?) {
        let commonView = TLCommonPopUpView()
        self.addSubviewIntoContentView(subView: commonView, footerButtons: footerButtons, headerData: headerData)
        commonView.data = data
    }
}

extension TLAlertViewController: TLAlertHeaderViewDelegate {
    func dismissPopUp(_ view: TLAlertHeaderView?) {
        delegate?.dismissAlertView(self)
        dismissVC()
    }
}

// MARK: TLFooterViewDelegate
extension TLAlertViewController: TLFooterViewDeleagte {
    func clickedOnButton(_ footerView: TLFooterView?, sender: UIButton) {
        delegate?.tappedOnFooterButton(footerView, sender: sender)
        dismissVC()
    }
}

