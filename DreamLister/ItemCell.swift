//
//  ItemCell.swift
//  DreamLister
//
//  Created by Jeff Ripke on 5/26/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    func configureCell(item: Item) {
        titleLabel.text = item.title
        priceLabel.text = ("$\(item.price)")
        detailsLabel.text = item.details
    }
    
}
