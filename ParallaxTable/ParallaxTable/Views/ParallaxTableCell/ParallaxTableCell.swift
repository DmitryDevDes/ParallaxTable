//
//  ParallaxTableCell.swift
//  ParallaxTable
//
//  Created by Дмитрий on 11/27/19.
//  Copyright © 2019 OwnDmitry. All rights reserved.
//

import UIKit

class ParallaxTableCell: UITableViewCell {
    @IBOutlet weak var parallaxImageView: UIImageView!
    @IBOutlet weak var parallaxHeightCostr: NSLayoutConstraint!
    @IBOutlet weak var parallaxTopConstr: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        parallaxImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with image: UIImage) {
        parallaxImageView.image = image
    }
}
