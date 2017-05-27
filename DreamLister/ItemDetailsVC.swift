//
//  ItemDeatailsViewController.swift
//  DreamLister
//
//  Created by Jeff Ripke on 5/26/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    }
}
