//
//  ChildViewController.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import UIKit

class ChildViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "I am Child View and i am added into bottom sheet"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var topImage: UIImageView =  {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
        
        view.addSubview(topImage)
        topImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        topImage.widthAnchor.constraint(equalToConstant: 400).isActive = true

//        view.addSubview(titleLabel)
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: topImage.topAnchor, constant: 10).isActive = true
//        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
////
           
//        guard let confettiImageView = UIImageView.fromGif(frame: topImage.frame, resourceName: "giphy") else { return }
//        topImage = confettiImageView
//        topImage.startAnimating()
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 200)
        guard let confettiImageView = UIImageView.fromGif(frame: frame, resourceName: "giphy") else { return }
        view.addSubview(confettiImageView)
        confettiImageView.startAnimating()
        
    }
}

extension UIImageView {
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}
