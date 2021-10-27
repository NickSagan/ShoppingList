//
//  ViewController.swift
//  ShoppingList
//
//  Created by Nick Sagan on 27.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = ["Test Item 1", "Test Item 2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Add new item:", message: nil, preferredStyle: .alert)
        ac.addTextField()
        // create submit alert button
        let addItemAction = UIAlertAction(title: "Add", style: .default) {
            // parameters we send into
            [weak self, weak ac] _ in
            // closure body
            guard let item = ac?.textFields?[0].text else {return}
            self?.submit(item)
        }
        ac.addAction(addItemAction)
        present(ac, animated: true, completion: nil)
    }
    
    func submit(_ item: String){
        //items.append(item)
        //tableView.reloadData()
        
        items.insert(item, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    @IBAction func trashButton(_ sender: UIBarButtonItem) {
        items = []
        tableView.reloadData()
    }
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        let itemsList = items.joined(separator: "\n")
        let shareController = UIActivityViewController(activityItems: [itemsList], applicationActivities: [])
        present(shareController, animated: true)
        


    }
}

