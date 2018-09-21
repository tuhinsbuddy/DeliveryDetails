//
//  DeliveryListPresenter.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import UIKit

class DeliveryListPresenter: DeliveryListPresenterProtocol {
    
    weak private var view: DeliveryListViewProtocol?
    var interactor: DeliveryListInteractorInputProtocol?
    
    init(interface: DeliveryListViewProtocol, interactor: DeliveryListInteractorInputProtocol?) {
        self.view = interface
        self.interactor = interactor
    }
    
    func loadView(){
        setupViews()
    }
}


private extension DeliveryListPresenter{
    private func setupViews(){
        guard let viewController = view as? DeliveryListViewController else {
            debugPrint("Failed to get viewcontroller inside presenter!")
            return
        }
        
        viewController.title = "Things to Deliver"
        viewController.view.backgroundColor = .white
        viewController.deliveryListTable.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(viewController.deliveryListTable)
        
        let safeArea = viewController.view.safeAreaLayoutGuide
        viewController.deliveryListTable.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        viewController.deliveryListTable.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        viewController.deliveryListTable.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        viewController.deliveryListTable.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true

        viewController.deliveryListTable.separatorStyle = .none
        viewController.deliveryListTable.showsHorizontalScrollIndicator = false
        viewController.deliveryListTable.showsVerticalScrollIndicator = false
        viewController.deliveryListTable.backgroundColor = .clear
        viewController.deliveryListTable.register(DeliveryListTableViewCell.self, forCellReuseIdentifier: "cell")
        viewController.deliveryListTable.rowHeight = UITableViewAutomaticDimension
        viewController.deliveryListTable.estimatedRowHeight = 100
        viewController.deliveryListTable.delegate = viewController
        viewController.deliveryListTable.dataSource = viewController
        
        let header: [String: String] = ["offset": "2", "limit": "20"]
        interactor?.getServerResponse(api: "\(HostName.hostUrl)\(EndPoint.deliveries)", header: header)
    }
}

extension DeliveryListPresenter: DeliveryListInteractorOutputProtocol{
    func serverDataResponse(data response: [DeliveryListData]?) {
        guard let viewController = view as? DeliveryListViewController, let responseCheck = response, !responseCheck.isEmpty else {
            debugPrint("Here error can be handled like screen unblock or maybe activity indicator hide etc.")
            return
        }
        
        viewController.deliveryListData = responseCheck
        viewController.deliveryListTable.reloadData()
    }
}
