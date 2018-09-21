//
//  DeliveryListViewController.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import UIKit

class DeliveryListViewController: UIViewController, DeliveryListViewProtocol {

	var presenter: DeliveryListPresenterProtocol?
    var deliveryListTable: UITableView = UITableView()
    var deliveryListData: [DeliveryListData]? = nil

    private var layoutManaged: Bool = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func loadView() {
        super.loadView()
        presenter?.loadView()
    }
}

extension DeliveryListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let deliveryData = deliveryListData, !deliveryData.isEmpty else {
            debugPrint("Delivery List Data is not present!")
            return
        }

        DeliveryDetailsRouter.gotoDeliveryDetails(from: self, withData: deliveryData[indexPath.row])
    }
}

extension DeliveryListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObject = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryListTableViewCell
        
        if let deliveryData = deliveryListData, !deliveryData.isEmpty{
            cellObject.setUpCellWith(data: deliveryData[indexPath.row])
        } else {
            cellObject.setUpCellWith(data: nil)
        }
        
        cellObject.layoutSubviews()
        return cellObject
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let deliveryData = deliveryListData, !deliveryData.isEmpty{
            return deliveryData.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
