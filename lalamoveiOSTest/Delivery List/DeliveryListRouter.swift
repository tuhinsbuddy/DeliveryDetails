//
//  DeliveryListRouter.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import UIKit

struct DeliveryListRouter {
    static func loadDeliveryList() -> UINavigationController {
        let view: DeliveryListViewController = DeliveryListViewController()
        let baseNavController: UINavigationController = UINavigationController(rootViewController: view)
        let interactor: DeliveryListInteractor = DeliveryListInteractor()
        let presenter: DeliveryListPresenter = DeliveryListPresenter(interface: view, interactor: interactor)
        view.presenter = presenter
        interactor.presenterOutput = presenter
        return baseNavController
    }
}
