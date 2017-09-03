//
//  ViewController.swift
//  FlagCollector
//
//  Created by Alexis on 9/2/17.
//  Copyright © 2017 Alexis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var flags: [Flag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do
        {
        flags = try context.fetch(Flag.fetchRequest())
            tableView.reloadData()
        }
        catch
        {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let flag = flags[indexPath.row]
        cell.textLabel?.text = flag.title
        cell.imageView?.image = UIImage(data: flag.image as! Data)
        return cell
        
    }


}

