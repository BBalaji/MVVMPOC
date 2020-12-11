//
//  MVVMTableViewController.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation
import UIKit

class MVVMTableViewController: UITableViewController {
    
   
    var infoModelData : InfoModel?
    var rowModelData : [RowModel] = []
    var contactData : [MVVMContactModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVVM"
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(MVVMInfoTableViewCell.self, forCellReuseIdentifier: MVVMInfoTableViewCell.identifier)

        fetchContactData()
    }
    
    
    
    fileprivate func fetchContactData() {
        Service.fetchContactMVVMData { (result) in
            switch result {
            case .success(let data):
                self.title = "updated Data"
                self.contactData = data
                self.tableView.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: MVVMInfoTableViewCell.identifier, for: indexPath) as! MVVMInfoTableViewCell
        cell.contactViewModel = MVVMViewModel(contactData[indexPath.row])
        
        return cell
    }

}


