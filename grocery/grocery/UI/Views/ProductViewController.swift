//
//  ProductViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 02/08/2021.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {
    
    var product: Product?
    
    private let background = UIView()


    static func loadFromStoryBoard() -> ProductViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createHeader()
        createContent()
    }
    
    private func createHeader() {
        guard let product = product else { return }
        
        let image = UIImageView()
        let backButton = UIButton()

        background.backgroundColor = product.backgroundColor
        background.layer.cornerRadius = 25

        image.image = imageWithImage(sourceImage: UIImage(named: product.image)!, scaledToWidth: 160.0)

        backButton.setImage(UIImage(named: "back-2"), for: .normal)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)

        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)

//            make.height.equalTo(280)
        }
        
        background.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerX.equalTo(background.snp.centerX)
            make.top.equalTo(background.snp.top).offset(100)
        }

        background.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalTo(background.snp.left).offset(24)
            make.top.equalTo(background.snp.top).offset(48)
        }
    }
    
    private func createContent() {
        let content = UIView()
        content.backgroundColor = UIColor.brand.backgroundColor
        content.layer.cornerRadius = 25
        view.addSubview(content)
        content.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(280)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom).offset(25)
        }
        
        
        let label = UILabel()
        label.text = product?.title
        content.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(content.snp.top).offset(32)
            make.left.equalTo(content.snp.left).offset(32)
        }
        
    }
    
    @objc private func didPressBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // remove
    func imageWithImage (sourceImage:UIImage, scaledToWidth: CGFloat) -> UIImage {
        let oldWidth = sourceImage.size.width
        let scaleFactor = scaledToWidth / oldWidth

        let newHeight = sourceImage.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor

        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        sourceImage.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

