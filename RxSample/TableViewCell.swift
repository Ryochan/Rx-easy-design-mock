//
//  TableViewCell.swift
//  RxSample
//
//  Created by 福田涼介 on 4/10/16.
//  Copyright © 2016 yuzushio. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var timeline: Timeline! {
        didSet {
            profileImage.image = timeline.profileImage
            usernameLabel.text = timeline.name
            bodyTextView.text = timeline.bodyContent
        }
    }
}
