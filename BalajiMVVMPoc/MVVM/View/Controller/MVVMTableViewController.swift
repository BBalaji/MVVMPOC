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

        fetchServerInfoData()
    }
    
    //MARK:- GCD Implemented
    func fetchServerInfoData()  {
        DispatchQueue.global(qos: .utility).async {
         Service.fetchServerInfoData { (result) in
          DispatchQueue.main.async {
              switch result {
                case let .success(data):
                    self.title = data?.title
                    self.infoModelData = data
                    self.rowModelData = data!.rows
                 self.tableView.reloadData()
                 case let .failure(error):
                    print(error)
                 }
             }
         }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowModelData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: MVVMInfoTableViewCell.identifier, for: indexPath) as! MVVMInfoTableViewCell
        cell.rowViewModel = MVVMRowViewModel(rowModelData[indexPath.row])
        return cell
    }

}


