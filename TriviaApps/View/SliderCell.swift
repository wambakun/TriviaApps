//
//  SliderCell.swift
//  TriviaApps
//
//  Created by DSMacbook on 24/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!{
        didSet{
            let viewController = ViewController()
            imageView.image = image
        }
    }
}
