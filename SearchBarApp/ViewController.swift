//
//  ViewController.swift
//  SearchBarApp
//
//  Created by ramjan sayyad on 10/08/18.
//  Copyright © 2018 ramjan sayyad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    let personarr = ["Ramjan","Imran","Heena","Arshad","Tina","Mina","Priyanka","Pooja","Sheetal","Farheen","Neha","Bhagyshree","Madhuri","Tanuja","Reshma","Heeram","Shamin","Tejashree"]
    var searchPerson = [String]()
    var searching = false
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searching
        {
        return searchPerson.count
        }
        else
        {
        return personarr.count
    }
    }
   
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        if searching
        {
            cell.textLabel?.text = searchPerson[indexPath.row]
        }else
        {
        cell.textLabel?.text = personarr[indexPath.row]
        
        }
        return cell
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
        
        searchPerson = personarr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableview.reloadData()
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searching = false
        searchBar.text = ""
        tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

