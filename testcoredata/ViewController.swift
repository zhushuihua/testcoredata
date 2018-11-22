//
//  ViewController.swift
//  testcoredata
//
//  Created by Shuihua Zhu on 22/11/18.
//  Copyright © 2018 UMA Mental Arithmetic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var entry:UITextField!
        let alert = UIAlertController(title: "Add Item To Core Data", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Key In New Item Here"
            entry = textField
        }
        let addAction = UIAlertAction(title: "Add", style: .default) {
            action in
            let item = Item(context: self.context)
            item.title = entry.text!
            item.done = false
            try? self.context.save()
        }
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

