//
//  ItemDeatailsViewController.swift
//  DreamLister
//
//  Created by Jeff Ripke on 5/26/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores = [Store]()
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
//        let store1 = Store(context: context)
//        store1.name = "Kubota Dealership"
//        let store2 = Store(context: context)
//        store2.name = "Apple Store"
//        let store3 = Store(context: context)
//        store3.name = "Ford Dealership"
//        let store4 = Store(context: context)
//        store4.name = "Amazon"
//        let store5 = Store(context: context)
//        store5.name = "Stihl Dealership"
//        let store6 = Store(context: context)
//        store6.name = "PJ Trailer Dealership"
//        
//        ad.saveContext()
        getStores()
        if itemToEdit != nil {
            loadItemData()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            stores = try context.fetch(fetchRequest)
            storePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    func loadItemData() {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while index < stores.count
            }
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        var item: Item!
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
}
