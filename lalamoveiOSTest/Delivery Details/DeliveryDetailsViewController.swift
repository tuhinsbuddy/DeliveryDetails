//
//  DeliveryDetailsViewController.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import UIKit
import GoogleMaps

class DeliveryDetailsViewController: UIViewController, DeliveryDetailsViewProtocol {
    
	var presenter: DeliveryDetailsPresenterProtocol?
    var mapSuperView: GMSMapView!
    var detailsSuperView: UIView = UIView()
    let detailImage: UIImageView = UIImageView()
    let lblDetails: UILabel = UILabel()
    
    override func loadView() {
        super.loadView()
        presenter?.loadView()
    }
}
