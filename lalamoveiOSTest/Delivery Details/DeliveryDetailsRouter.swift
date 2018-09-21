//
//  DeliveryDetailsRouter.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import UIKit

struct DeliveryDetailsRouter {
    static func gotoDeliveryDetails(from vc: UIViewController, withData data: DeliveryListData){
        DispatchQueue.main.async {
            let view = DeliveryDetailsViewController()
            let presenter = DeliveryDetailsPresenter(interface: view, data: data)
            view.presenter = presenter
            vc.show(view, sender: vc)
        }
    }
}
