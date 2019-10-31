//
//  HomeCell.swift
//  TriviaApps
//
//  Created by DSMacbook on 27/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var imageTitle: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var images: UIImage!{
        didSet{
            imageTitle.image = images
        }
    }
    var title: String!{
        didSet{
            titleLabel.text = title
        }
    }
    
    
}
