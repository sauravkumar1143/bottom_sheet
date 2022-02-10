//
//  ChildViewController.swift
//  BottomSheet
//
//  Created by Saurav Kumar on 19/01/22.
//

import UIKit

class ChildViewController: UIViewController {
    
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
