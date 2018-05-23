//
//  HomeViewController.swift
//  Lifebar
//
//  Created by Timbology on 30/04/2018.
//  Copyright © 2018 Timbology. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tablevIiew:UITableView!
    
    var shelters = [Shelter]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablevIiew = UITableView(frame: view.bounds, style: .plain)
        
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tablevIiew.register(cellNib, forCellReuseIdentifier: "postCell")
        view.addSubview(tablevIiew)
        
        var layoutGuide:UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            //call to earlier versions
            layoutGuide = view.layoutMarginsGuide
        }
        
        tablevIiew.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tablevIiew.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tablevIiew.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tablevIiew.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        tablevIiew.delegate = self
        tablevIiew.dataSource = self
        tablevIiew.tableFooterView = UIView()
        tablevIiew.reloadData()
        
    }
    
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.set(shelter: shelters[indexPath.row])
        return cell
    }
}
