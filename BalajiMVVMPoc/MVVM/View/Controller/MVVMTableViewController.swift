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
//    var contactData : [MVVMContactModel] = []
    var tableViewScrolling : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVVM"
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MVVMInfoTableViewCell.self, forCellReuseIdentifier: MVVMInfoTableViewCell.identifier)

        fetchServerInfoData()
        //Pull to refresh UITableview data
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self,
                                            action: #selector(didPullToRefresh), for: .valueChanged)
    }
    //MARK:- Did Pull To Refresh
    @objc private func didPullToRefresh(){
        //Re-fetch data
        fetchServerInfoData()
    }
    
    //MARK:- GCD Implemented
    func fetchServerInfoData()  {
        rowModelData.removeAll()
        DispatchQueue.global(qos: .utility).async {
         Service.fetchServerInfoData { (result) in
              switch result {
                case let .success(data):
                    self.title = data?.title
                    self.infoModelData = data
                    let tempRowModelData: [RowModel]? = data?.rows
                    //Struct empty variable validation
                    self.rowModelData = (tempRowModelData?.filter { $0.title != nil && $0.rowDescription != "" && $0.imageHref != "" })!
//                    self.do_table_refresh()
                    DispatchQueue.main.async {
                        self.tableView.refreshControl?.endRefreshing()
                        self.tableView.reloadData()
                    }
                 case let .failure(error):
                    print(error)
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
        cell.selectionStyle = .none
        cell.rowViewModel = MVVMRowViewModel(rowModelData[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create new Alert
        let title = rowModelData[indexPath.row].title
        let dialogMessage = UIAlertController(title: "Title", message: title, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)

        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
}


